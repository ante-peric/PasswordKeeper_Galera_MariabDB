#!/bin/bash
#Vol 1

check_prerequisite(){
#Variables
db_pass="Ante@peric00810820"
db_user="ante"
db1="192.168.2.217"
db2="192.168.2.218"
db3="192.168.2.219"

#Test for database conn
test_db_1=$(mysqladmin --host="$db1" --user="$db_user" --password="$db_pass" ping 2> /dev/null) 
test_db_2=$(mysqladmin --host="$db2" --user="$db_user" --password="$db_pass" ping 2> /dev/null)
test_db_3=$(mysqladmin --host="$db3" --user="$db_user" --password="$db_pass" ping 2> /dev/null)


if [ "$test_db_1" == "mysqld is alive" ]; then
login_1
else
if [ "$test_db_2" == "mysqld is alive" ]; then
login_2
else
if [ "$test_db_3" == "mysqld is alive" ]; then
login_3
else
echo "$(tput setaf 1)Error: Cluster Is Dead - Please Contact Your Administrator$(tput sgr 0)"
sleep 3
exit 0
fi
fi
fi 
	
}



login_1(){
echo ""

while true; do	
COLUMNS=$(tput cols)
title="$(tput setaf 6)CaksSonicDeveloper$(tput sgr 0)"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
echo ""
title_1="$(tput setaf 6) PASSWORD KEEPER - LOGIN MENU$(tput sgr 0)"
printf "%*s\n" $(((${#title_1}+$COLUMNS)/2)) "$title_1"
echo ""
title_2="$(tput setaf 2)Welcome $USER$(tput sgr 0)"
printf "%*s\n" $(((${#title_2}+$COLUMNS)/2)) "$title_2"

echo ""

echo "$(tput setaf 2)Please Insert Your Credientials:$(tput sgr 0) "
echo ""
read -p  "Enter User Name: " name
echo ""
read -s -p "Enter password: " password
echo ""
echo ""
echo ""

if [[ -z "$name" ]] || [[ -z "$password" ]]; then
echo "$(tput setaf 1)WARNNING: Blank User Name or Password Not Alllowed$(tput sgr 0)"
sleep 2
clear
login_1
else


cat << _EOF_

 ____________
|            |
| 1. Login   |
|            |
| 0. Quit    |
|____________|

_EOF_


echo ""
read -p "Enter selection [0 - 1] > "
echo ""

if [[ $REPLY =~ ^[0-1]$ ]];then
case $REPLY in

1)
test_1=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ "
SELECT administrator from administrator where administrator='$name';" pk_cluster)

test_2=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ "
SELECT administrator_password from administrator where administrator_password='$password';" pk_cluster)

test_3=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ "
SELECT admin from korisnici where admin='$name';" pk_cluster)

test_4=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ "
SELECT admin_password from korisnici where admin_password='$password';" pk_cluster)


test_5=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ " 
SELECT korisnik FROM korisnici where korisnik='$name';" pk_cluster)

test_6=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db1" -P 3306 -e \ " 
SELECT zaporka FROM korisnici where zaporka='$password';" pk_cluster)

 
if [ "$test_1" != "" ] && [ "$test_2" != "" ] && [ "$test_3" != "" ] && [ "$test_4" != "" ] ; then
if [ "$test_1" = "$test_3" ] && [ "$test_2" = "$test_4" ]; then
admin_area
else
echo "No Match"
sleep 11
fi
else
if [ "$test_5" == "$name" ] && [ "$test_6" == "$password" ]; then
user_area
else
echo "$(tput setaf 1)Warnning: Incorect User Name Or Password $(tput sgr 0)"
sleep 3
clear
fi
fi
;;

0)
echo "$(tput setaf 1)Program Terminated$(tput sgr 0)"
exit 0
esac
else
echo "$(tput setaf 1)Invalid Entry$(tput sgr 0)"
sleep 3
clear
fi
fi
done
}

login_2(){
echo ""

while true; do	
COLUMNS=$(tput cols)
title="$(tput setaf 6)CaksSonicDeveloper$(tput sgr 0)"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
echo ""
title_1="$(tput setaf 6) PASSWORD KEEPER - LOGIN MENU$(tput sgr 0)"
printf "%*s\n" $(((${#title_1}+$COLUMNS)/2)) "$title_1"
echo ""
title_2="$(tput setaf 2)Welcome $USER$(tput sgr 0)"
printf "%*s\n" $(((${#title_2}+$COLUMNS)/2)) "$title_2"

echo ""

echo "$(tput setaf 2)Please Insert Your Credientials:$(tput sgr 0) "
echo ""
read -p  "Enter User Name: " name
echo ""
read -s -p "Enter password: " password
echo ""
echo ""
echo ""

if [[ -z "$name" ]] || [[ -z "$password" ]]; then
echo "$(tput setaf 1)WARNNING: Blank User Name or Password Not Alllowed$(tput sgr 0)"
sleep 2
clear
login_1
else


cat << _EOF_

 ____________
|            |
| 1. Login   |
|            |
| 0. Quit    |
|____________|

_EOF_


echo ""
read -p "Enter selection [0 - 1] > "
echo ""

if [[ $REPLY =~ ^[0-1]$ ]];then
case $REPLY in

1)
test_1=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ "
SELECT administrator from administrator where administrator='$name';" pk_cluster)

test_2=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ "
SELECT administrator_password from administrator where administrator_password='$password';" pk_cluster)

test_3=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ "
SELECT admin from korisnici where admin='$name';" pk_cluster)

test_4=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ "
SELECT admin_password from korisnici where admin_password='$password';" pk_cluster)


test_5=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ " 
SELECT korisnik FROM korisnici where korisnik='$name';" pk_cluster)

test_6=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db2" -P 3306 -e \ " 
SELECT zaporka FROM korisnici where zaporka='$password';" pk_cluster)

 
if [ "$test_1" != "" ] && [ "$test_2" != "" ] && [ "$test_3" != "" ] && [ "$test_4" != "" ] ; then
if [ "$test_1" = "$test_3" ] && [ "$test_2" = "$test_4" ]; then
admin_area
else
echo "No Match"
sleep 11
fi
else
if [ "$test_5" == "$name" ] && [ "$test_6" == "$password" ]; then
user_area
else
echo "$(tput setaf 1)Warnning: Incorect User Name Or Password $(tput sgr 0)"
sleep 3
clear
fi
fi
;;

0)
echo "$(tput setaf 1)Program Terminated$(tput sgr 0)"
exit 0
esac
else
echo "$(tput setaf 1)Invalid Entry$(tput sgr 0)"
sleep 3
clear
fi
fi
done
}

login_3(){
echo ""
while true; do	
COLUMNS=$(tput cols)
title="$(tput setaf 6)CaksSonicDeveloper$(tput sgr 0)"
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
echo ""
title_1="$(tput setaf 6) PASSWORD KEEPER - LOGIN MENU$(tput sgr 0)"
printf "%*s\n" $(((${#title_1}+$COLUMNS)/2)) "$title_1"
echo ""
title_2="$(tput setaf 2)Welcome $USER$(tput sgr 0)"
printf "%*s\n" $(((${#title_2}+$COLUMNS)/2)) "$title_2"

echo ""

echo "$(tput setaf 2)Please Insert Your Credientials:$(tput sgr 0) "
echo ""
read -p  "Enter User Name: " name
echo ""
read -s -p "Enter password: " password
echo ""
echo ""
echo ""

if [[ -z "$name" ]] || [[ -z "$password" ]]; then
echo "$(tput setaf 1)WARNNING: Blank User Name or Password Not Alllowed$(tput sgr 0)"
sleep 2
clear
login_1
else


cat << _EOF_

 ____________
|            |
| 1. Login   |
|            |
| 0. Quit    |
|____________|

_EOF_


echo ""
read -p "Enter selection [0 - 1] > "
echo ""

if [[ $REPLY =~ ^[0-1]$ ]];then
case $REPLY in

1)
test_1=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ "
SELECT administrator from administrator where administrator='$name';" pk_cluster)

test_2=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ "
SELECT administrator_password from administrator where administrator_password='$password';" pk_cluster)

test_3=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ "
SELECT admin from korisnici where admin='$name';" pk_cluster)

test_4=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ "
SELECT admin_password from korisnici where admin_password='$password';" pk_cluster)


test_5=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ " 
SELECT korisnik FROM korisnici where korisnik='$name';" pk_cluster)

test_6=$(mysql -sN -u "$db_user" -p"$db_pass" -h "$db3" -P 3306 -e \ " 
SELECT zaporka FROM korisnici where zaporka='$password';" pk_cluster)

 
if [ "$test_1" != "" ] && [ "$test_2" != "" ] && [ "$test_3" != "" ] && [ "$test_4" != "" ] ; then
if [ "$test_1" = "$test_3" ] && [ "$test_2" = "$test_4" ]; then
admin_area
else
echo "No Match"
sleep 11
fi
else
if [ "$test_5" == "$name" ] && [ "$test_6" == "$password" ]; then
user_area
else
echo "$(tput setaf 1)Warnning: Incorect User Name Or Password $(tput sgr 0)"
sleep 3
clear
fi
fi
;;

0)
echo "$(tput setaf 1)Program Terminated$(tput sgr 0)"
exit 0
esac
else
echo "$(tput setaf 1)Invalid Entry$(tput sgr 0)"
sleep 3
clear
fi
fi
done
}

admin_area(){
echo "This Is Admin Area"
sleep 3
return	
}

user_area(){
echo "This Is User Area"
sleep 3
return	
}


check_prerequisite
