const express = require('express');
const cookieParser = require('cookie-parser');
const csrf = require('csurf');
const helmet = require('helmet'); // Import Helmet
const indexRoutes = require('./router/index');
const app = express();
const appJson = require('./config/app.json');

// Use Helmet to set secure HTTP headers
app.use(helmet());

// Enable cookie parsing
app.use(cookieParser());

// Enable CSRF protection middleware
const csrfProtection = csrf({ cookie: true });
app.use(csrfProtection);

// Parse JSON bodies for incoming requests
app.use(express.json());

// Pass routes to the app
indexRoutes(app);

// Error handling for invalid CSRF tokens
app.use((err, req, res, next) => {
  if (err.code === 'EBADCSRFTOKEN') {
    res.status(403).json({ error: 'Invalid CSRF token' });
  } else {
    next(err);
  }
});