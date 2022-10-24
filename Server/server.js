const http = require("http");
var express = require("express");
var fs = require('fs');
const bodyParser = require('body-parser');

var logFile = fs.createWriteStream('./myLogFile.log', {flags: 'w'}); //use {flags: 'w'} to open in write mode

var app = express();
app.use(bodyParser.urlencoded({ extended: true }));

let output = ""; 

app.listen(3000, '10.2.1.20');

app.get('/yes', (req, res) => {
    res.send('POST request to the homepage')
  })

app.get("/url", (req, res, next) => {
    res.json({"Tx Hash":"0xfe6bec470e13c474fbec1ba6a51c9920aafde6ab3fd674592258d2eacfa91983"});
   });

