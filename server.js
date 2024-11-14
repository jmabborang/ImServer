// index.js
const express = require('express');
const indexRoutes = require('./router/index')
const app = express();
const appJson = require('./config/app.json')
const indexRouter = require('./router/index');
// Use the index of the routes
app.use('/index', indexRouter);

const port = process.env.PORT || appJson.development.port
app.listen(port);

indexRoutes(app)