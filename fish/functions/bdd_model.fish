function bdd_model
  echo "mysql -u root qosenergy_development -e \"describe $argv\""
  mysql -u root qosenergy_development -e "describe $argv"
end

