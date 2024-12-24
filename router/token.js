const express = require('express')
const router = express.Router()

// Route to get the CSRF token for frontend
router.get('/token', (req, res) => {
	res.json({ csrfToken: req.csrfToken() });
});

module.exports = router