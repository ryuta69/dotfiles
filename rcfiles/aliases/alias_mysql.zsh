alias sqlconnect='mysql -u root'
alias sqlstart='mysql.server start'
alias sqlstatus='service mysqld status'
function sqlshow() {
	read db"?type db    : ";
	read table"?type table : ";
	mysql -u root -p ${db} -e"select * from ${table}"
}
