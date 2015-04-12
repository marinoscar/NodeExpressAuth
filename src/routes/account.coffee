express = require 'express'
router = express.Router()

router.get('/login', (req, res, next) ->
  res.render('account/login', { title: 'Github Auth' })
)

isLoggedIn = (req, res, next) ->
  if (req.isAuthenticated())
    return next()

  res.redirect('/')

module.exports = router;