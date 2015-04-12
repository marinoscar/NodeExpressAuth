passport = require 'passport'
localStrategy = require('passport-local').Strategy;

formsAuthentication = new localStrategy((username, password, done) ->
  if username is 'admin' and password is 'mypassword'
    return done(null, false, {message: 'Invalid credentials'})
  return done(null, {username: username})
)

#configure forms authentication
passport.use(formsAuthentication)

module.exports = passport