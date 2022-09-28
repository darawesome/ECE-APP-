var express = require('express');
var path = require('path');

var db=require('./dbConfig');

var app = express();

app.use(express.static(path.join(__dirname, 'public')));

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.get('/', function(req, res) {
		res.render("home");
});

app.get('/createUser', function(req, res){
		res.render('createUser');
	});
app.get('/login', function(req, res){
		res.render('login');
	});

app.get('/contactUs', function(req, res) {
		res.render("contactUs");
});

app.get('/admin', function(req, res) {
		res.render("admin");
});

app.get('/teacher', function(req, res) {
		res.render("teacher");
});
	

app.get('/getParents', function(req, res){
	db.query(`SELECT * FROM parent2`, function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getParents', { title: 'Parents Details', parentData: result});
	});
});

app.get('/getChildren', function(req, res){
	db.query("SELECT children2.childId, children2.childName, children2.childAge, " +
			" children2.parentEmail, parent2.parentName FROM children2 " +
			" INNER JOIN parent2 ON children2.parentEmail=parent2.parentEmail", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getChildren', { title: 'Children Details', childrenData: result});
	});
});


app.get('/addParent', function(req, res){
		res.render('addParent');
	});

app.post('/addParent', function(req, res, next) {
	var parentName = req.body.parentName;
	var parentEmail = req.body.parentEmail;
    var parentPhone = req.body.parentPhone;
    var password = req.body.password;
	var sql = `INSERT INTO parent2 (parentName, parentEmail, parentPhone, password) VALUES ("${parentName}", "${parentEmail}", "${parentPhone}", "${password}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('record inserted');
		res.render('addParent');
	});
});


app.post('/login', function(req, res, next) {
	var parentName = req.body.parentName;
	var password = req.body.password; 
	var sql = `SELECT * FROM parent2 WHERE parentName = "${parentName}" AND password = "${password}"`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('user login successful');
		console.log(result);
		res.render('getParents', { title: 'Parents Details', parentData: result});
        
	});
}); 

app.post('/createUser', function(req, res, next) {
	var parentName = req.body.parentName;
	var password = req.body.password; 
	var sql = `UPDATE parent2 SET password = "${password}" WHERE parentName = "${parentName}" `;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('user sign up succesful');
		res.render('login');
	});
}); 

app.get('/addChild', function(req, res){
		res.render('addChild');
	});

app.post('/addChild', function(req, res, next) {
	var childName = req.body.childName;
	var childAge = req.body.childAge;
	var parentEmail = req.body.parentEmail;
	var sql = `INSERT INTO children2 (childName, childAge, parentEmail) VALUES ("${childName}", "${childAge}", "${parentEmail}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('Child record inserted');
		res.render('addChild');
	});
});


app.get('/addDailyMeal', function(req, res){
		res.render('addDailyMeal');
	});

app.post('/addDailyMeal', function(req, res, next) {
	var breakfast = req.body.breakfast;
	var morningTea = req.body.morningTea;
	var lunch =  req.body.lunch;
    var afternoonTea =  req.body.afternoonTea;
    var childID =  req.body.childID;
    console.log(childID);
	var sql = `INSERT INTO dailyMeals (breakfast, morningTea, lunch, afternoonTea, childID)` +
	`VALUES ("${breakfast}", "${morningTea}", "${lunch}","${afternoonTea}", "${childID}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('Child daily meal inserted');
		res.render('addDailyMeal');
	});
});

app.get('/getDailyMeals', function(req, res){
	db.query("SELECT dailyMeals.breakfast, dailyMeals.morningTea, dailyMeals.lunch, dailyMeals.afternoonTea, dailyMeals.childID FROM dailyMeals", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getDailyMeals', { title: 'Children Daily Meals', dailyMealData: result});
	});
});

app.get('/addAccidentReport', function(req, res){
		res.render('addAccidentReport');
	});

app.post('/addAccidentReport', function(req, res, next) {
    var childID = req.body.childId;
	var childName = req.body.childName;
	var className =  req.body.className;
    var teacherName =  req.body.teacherName;
    var accidentReport =  req.body.accidentReport;
	var sql = `INSERT INTO accidentReports (childID, childName, className, teacherName, accidentReport)` +
	`VALUES ("${childID}", "${childName}", "${className}","${teacherName}", "${accidentReport}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('Child accident reported');
		res.render('addAccidentReport');
	});
});

app.get('/getAccidentReports', function(req, res){
	db.query("SELECT accidentReports.childID, accidentReports.childName, accidentReports.className, accidentReports.teacherName, accidentReports.accidentReport FROM accidentReports", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getAccidentReports', { title: 'Children Accident Reports', accidentReportData: result});
	});
});

app.get('/addTeacher', function(req, res){
		res.render('addTeacher');
	});

app.post('/addTeacher', function(req, res, next) {
	var teacherID = req.body.teacherID;
	var teacherName = req.body.teacherName;
	var className =  req.body.className;
	var sql = `INSERT INTO teacher (teacherID, teacherName, className)` +
	`VALUES ("${teacherID}", "${teacherName}", "${className}","${teacherName}", "${accidentReport}"`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('Child accident reported');
		res.render('addAccidentReport');
	});
});

app.get('/getTeachers', function(req, res){
	db.query("SELECT accidentReports.childName, accidentReports.childID, accidentReports.className, accidentReports.teacherName, accidentReports.accidentReport FROM accidentReports", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getAccidentReports', { title: 'Children Accident Reports', accidentReportData: result});
	});
});

app.get('/addSleepLog', function(req, res){
		res.render('addSleepLog');
	});

app.post('/addSleepLog', function(req, res, next) {
	var childName = req.body.childName;
	var className = req.body.className;
    var teacherName = req.body.teacherName;
    var sleepLog = req.body.sleepLog;
	var sql = `INSERT INTO sleepLogs (childName, className, teacherName, sleepLog) VALUES ("${childName}", "${className}",  "${teacherName}", "${sleepLog}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('Sleep log added');
		res.render('addSleepLog');
	});
});

app.get('/getSleepLogs', function(req, res){
	db.query("SELECT sleepLogs.childName, sleepLogs.className, sleepLogs.teacherName, sleepLogs.sleepLog FROM sleepLogs", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getSleepLogs', { title: 'Sleep Logs', sleepLogData: result});
	});
});

app.listen(3000);
console.log('Node app is running on port 3000');

/*
app.get('/getEmployee', function(req, res){
	db.query("SELECT employee.id, employee.name, employee.position, employee.wage, " +
			" employee.company_id, company.company_name FROM employee " +
			" INNER JOIN company ON employee.company_id=company.id", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getEmployee', { title: 'Employee Details', employeeData: result});
	});
});

app.get('/getEmployee/:employeeId',  (req, res, next)=>{
	db.query("SELECT * FROM employee WHERE id='"+req.params.employeeId+"'", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getEmployee', { title: 'Employee Details', employeeData: result});
	});
 });
 
app.get('/getCompanyEmployee/:companyId',  (req, res, next)=>{
	db.query("SELECT * FROM employee WHERE company_id='"+req.params.companyId+"'", function (err, result) {
		if (err) throw err;
		console.log(result);
		res.render('getCompanyEmployee', { title: 'Employee Details', employeeData: result});
	});
 });
 
 
 app.get('/addEmployees', function(req, res, next) {
	res.render('addEmployees', { title: 'Add Employees' });
});

app.post('/addEmployees', function(req, res, next) {
	var name = req.body.name;
	var position = req.body.position;
	var company_id = req.body.company_id;
	var wage = req.body.wage;
	var sql = `INSERT INTO employee (name, position, wage, company_id) VALUES ("${name}", "${position}", "${wage}", "${company_id}")`;
	db.query(sql, function(err, result) {
		if (err) throw err;
		console.log('record inserted');
		res.render('addEmployees');
	});
});
*/


