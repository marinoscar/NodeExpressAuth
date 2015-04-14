localStrategy = require('passport-local').Strategy
GitHubStrategy = require('passport-github').Strategy
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

  #configure GitHub authentication
  passport.use('github', new GitHubStrategy({
    clientID: '32d29cd28dc740123247',
    clientSecret: 'c1597b8d29b53ce352d88decae82320629ccdf59',
    callbackURL: 'http://localhost:3000/auth/github/callback'
    }, (accessToken, refreshToken, profile, done) ->
      #here is where we store the bearing token to use it for any future requests
      console.log("access token: #{accessToken}")
      userStore = new UserStore()
      user = userStore.createInstance()
      user.profile = profile
      user.data = JSON.parse(profile._raw)
      return done(null, user)
    )
  )

  passport.serializeUser((user, done) ->
    console.log('Serializing ' + user.providerKey)
    done(null, user.providerKey)
  )

  passport.deserializeUser((obj, done) ->
    console.log('Deserializing ' + obj)
    store = new UserStore()
    user = store.findByKey(obj)
    done(null, user)
  )