alias sqlstart='mysql.server start'
alias sqlconnect='mysql -u root'
alias sqlstatus='service mysqld status'
function sqlshow() {
	read -p "type db    : " db;
	read -p "type table : " table;
	mysql -u root -p ${db} -e"select * from ${table}"
}
