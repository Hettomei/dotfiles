// ==UserScript==
// @name         bankin copie les montants
// @namespace    http://tim.net
// @copyright    MIT
// @version      0.1
// @description  Copy all the amout for a given month
// @author       Timothée
// @match        https://app2.bankin.com/accounts/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=tampermonkey.net
// @grant        GM_setClipboard
// ==/UserScript==

async function _waitForElement(selector, delay = 500) {
    let current = 0;
    let transactions = [];

    while(transactions.length == 0) {
        console.log("try to find selector: ", selector, "attempt : ", current);
        transactions = document.querySelectorAll(selector);
        if (transactions.length == 0) {
            await new Promise(resolve => setTimeout(resolve, delay));
        }
        current++;
    }
    if (transactions.length == 1) { return transactions[0] };
    return [];
}

const months_bankin_map = ['janv.', 'févr.', 'mars', 'avr.', 'mai','juin', 'juil.', 'août', 'sept.', 'oct.', 'nov.', 'dec.']

function extractData(ulElement) {
    return Array.from(ulElement.children)
        .map(transaction => {
        if (transaction.id.startsWith("transaction")) {
            const content = transaction.querySelector("span.amount").textContent; //-152,53 €
            const forGoogleDoc = content.replaceAll(/[^0-9,]/g, ""); // remove every space or nbsp or "-" or "€"
            const value = parseFloat(content.replaceAll(/[^0-9,-]/g, "").replace(",", ".")); // remove every thing to convert to a float, so weed need to keep the "-" sign
            const txtDate = transaction.querySelector("div.headerDate div").textContent; // "Hier" "Aujourd'hui" "jeudi 6 avr. 2023"

            // "Hier" -> "Hier"
            // "Aujourd'hui" -> "Aujourd'hui'
            // "jeudi 6 avr. 2023" -> "avr. 2023"
            let date = txtDate.split(" ").splice(-2).join(" ")

            // map "Aujourd'hui" vers "nov. 2023"
            if (date == "Aujourd'hui") {
                const current_month = (new Date()).getMonth()
                date = months_bankin_map[current_month] + " " + (new Date()).getFullYear();
                console.log("aujourd hui devient " + date);
            }
            // map "Hier" vers "oct. 2023"
            else if (date == "Hier") {
                const yesterday = new Date(Date.now() - 86400000); // remove 1day in millisec
                const current_month = yesterday.getMonth()
                date = months_bankin_map[current_month] + " " + yesterday.getFullYear();
                console.log("hier devient " + date);
            }

            return [content, forGoogleDoc, value, date];

        }
        return null;
    })
        .filter(e => e)
        .reverse(); // on veut du plus ancien au plus recent. aide pour avoir une date fixe.
}

function group_by_month(data) {
    const by_month = [];
    let current_date = data[0][3];
    let current_month = [];

    data.forEach(d => {
        // if (d[3] != "Hier" && d[3] != "Aujourd'hui" && d[3] != current_date) { // hier et aujourd hui pas correctement gere
        if (d[3] != current_date) {
            by_month.push([current_date, current_month]);
            current_date = d[3];
            current_month = [];
        }
        current_month.push(d);
    });

    by_month.push([current_date, current_month]);

    return by_month.reverse(); // on veut le mois en cours en premier.
}

function insertDataInPage(transactions_by_month) {
    const div = document.createElement("div");
    div.style.backgroundColor = "wheat";
    div.style.position = "fixed";
    div.style.width = "250px";
    div.style.right = "0";
    div.style.overflowY = "scroll";
    div.style.zIndex = "10000";
    div.style.top = "0";
    div.style.height = "800px";

    let table;

    transactions_by_month.forEach(month_and_data => {
        const title_month = document.createElement("h1");
        title_month.appendChild(document.createTextNode(month_and_data[0]));
        div.appendChild(title_month);

        table = document.createElement("table");
        table.style.display = "block";
        div.appendChild(table);

        month_and_data[1].forEach(d => {
            const tr = document.createElement("tr");
            const depense = document.createElement("td");
            depense.style.width = "100px";
            let recette = document.createElement("td");

            let depense_or_recette = depense;
            if(d[2] > 0) { // montant plus quand que 0, c est une recette
                depense_or_recette = recette;
            }

            depense_or_recette.appendChild(document.createTextNode(d[1]));
            tr.appendChild(depense);
            tr.appendChild(recette);
            table.appendChild(tr);
        });


    });


    document.body.appendChild(div);
}

(async function() {
    'use strict';
    console.log("Running bankin script");
    const ul_transactions = await _waitForElement("ul.transactionList");
    console.log(ul_transactions);

    const transactions = extractData(ul_transactions);
    const transactions_by_month = group_by_month(transactions);

    console.log(transactions);
    console.log(transactions_by_month);
    insertDataInPage(transactions_by_month);


    // GM_setClipboard("<ul><li>test1</li><li>test1</li><li>test3</li></ul>", "html");
})();
