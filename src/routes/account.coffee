express = require 'express'
router = express.Router()

router.get('/login', (req, res, next) ->
  res.render('account/login', { title: 'Github Auth' })
)

module.exports = router;