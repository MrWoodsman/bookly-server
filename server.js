// TEST

var express = require('express');
const cors = require('cors');

var app = express();

var { con } = require('./db'); // importowanie con z db.js
var prefix = `[server]`;

var port = 3000;

app.use(cors());

// API
app.get('/api/get/products', (req, res) => {
	con.query('SELECT * FROM usługi', function (error, results, fields) {
		if (error) throw error;

		res.json(results);
	});
});

app.listen(port, () => {
	console.log(`${prefix} Server działa na porcie ${port}`);
});
