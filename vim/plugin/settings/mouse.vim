if has('mouse')
  set mouse=a
endif

"Fix bug : mouse before cannot go to 220 char to the right
"This fix it
"https://code.google.com/p/iterm2/issues/detail?can=2&start=0&num=100&q=&colspec=ID%20Type%20Status%20Priority%20Milestone%20Owner%20Summary&groupby=&sort=&id=1830
if has('mouse_sgr')
  set ttymouse=sgr
endif
