alias sqlstart='mysql.server start'
alias sqlstop='mysql.server stop'
alias sqlstatus='mysql.server status'
alias sqlconnect='mycli -u root'
sqlformat() {
	for i in $(fd); do
		sql-formatter-cli -i $i -o $i
	done
}
