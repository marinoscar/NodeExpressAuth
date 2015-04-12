localStrategy = require('passport-local').Strategy;
UserStore = require '../services/userStore'

module.exports = (passport) ->

  #configure forms authentication
  passport.use('local', new localStrategy((username, password, done) ->
      store = new UserStore()
      user = store.find(username)
      if user is null
        return done(null, false, {message: 'Invalid user'})
      if user.password isnt password
        return done(null, false, {message: 'Invalid password'})
      done(null, user)
    )
  )