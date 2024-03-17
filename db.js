var mysql = require('mysql');

var prefix = `[mysql]`;

var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'system_rezerwacji',
});

con.connect(function (err) {
	if (err) {
		console.error(`${prefix} error connecting: ${err.stack}`);
		return;
	}

	console.log(`${prefix} connected as id ${con.threadId}`);
});

module.exports = { con };
