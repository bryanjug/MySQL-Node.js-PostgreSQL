for(var i = 0; i < 500; i++) {
    console.log("Hello World!");
}

//insert a new user into the database
for(var i = 0; i < 500; i++) {
    
}

//npm install faker
var faker = require('faker');
var mysql = require('mysql');

var connection = mysql.createConnection( {
    host        : 'localhost',
    user        : 'bryanjug',
    database    : 'join_us'
});

var q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() AS now';

connection.query(q, function (error, results, fields) {
   if (error) throw error;
   console.log(results[0].time);
   console.log(results[0].date);
   console.log(results[0].now);
});

connection.end();

// console.log(faker.internet.email());
// console.log(faker.date.past());

// function generateAddress() {
    
//     console.log(faker.address.state());
//     console.log(faker.address.city());
//     console.log(faker.address.streetAddress());
// }

// generateAddress();
// generateAddress();
// generateAddress();

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
    );

INSERT INTO users (email) VALUES
('Katie324@yahoo.com'), ('Tunde@gmail.com');
;

//fast way to start a new app
//creates log file
npm init

//shows request info
console.log(req);

//database triggers
CREATE TRIGGER trigger_name
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;

//trigger_time
BEFORE
AFTER
//trigger_event
INSERT
UPDATE
DELETE
//table_NAME
PHOTOS
USERS

//validating data
