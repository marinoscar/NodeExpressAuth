express = require 'express'
passport = require 'passport'
router = express.Router()

router.get('/login', (req, res, next) ->
  res.render('account/login', { title: 'Github Auth' })
)

router.post('/login', passport.authenticate('local', {
  successRedirect: '/',
  failureRedirect: '/account/login',
  failureFlash: true
}))

isLoggedIn = (req, res, next) ->
  if (req.isAuthenticated())
    return next()

  res.redirect('/')

module.exports = router;