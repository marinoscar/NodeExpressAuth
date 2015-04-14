express = require 'express'
passport = require 'passport'
router = express.Router()

# github authentication
router.get('/', passport.authenticate('github'),(req, res) ->
  console.log('something went wrong in the github auth')
)

router.get('/callback',
  passport.authenticate('github', { failureRedirect: '/failed' }),
  (req, res) ->
    console.log('github authenticated')
    res.redirect('/')
)

module.exports = router;