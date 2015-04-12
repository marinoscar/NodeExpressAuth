passport = require 'passport'
localStrategy = require('passport-local').Strategy;
UserStore = require '../services/userStore'

formsAuthentication = new localStrategy((username, password, done) ->
  store = new UserStore()
  user = store.find(username)
  if user is null
    return done(null, false, {message: 'Invalid user'})
  if user.password isnt password
    return done(null, false, {message: 'Invalid password'})
  return done(null, user)
)

#configure forms authentication
passport.use(formsAuthentication)

module.exports = passport