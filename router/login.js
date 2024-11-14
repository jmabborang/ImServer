const express = require('express')
const router = express.Router()

router.post('/first', async (req, res) => {
	res.json({success: true})
})
router.get('/second', async (req, res) => {
	res.send('Test')
})


module.exports = router