// Generated by CoffeeScript 1.9.1
(function() {
  var formsAuthentication, localStrategy, passport;

  passport = require('passport');

  localStrategy = require('passport-local').Strategy;

  formsAuthentication = new localStrategy(function(username, password, done) {
    if (username === 'admin' && password === 'mypassword') {
      return done(null, false, {
        message: 'Invalid credentials'
      });
    }
    return done(null, {
      username: username
    });
  });

  passport.use(formsAuthentication);

  module.exports = passport;

}).call(this);

//# sourceMappingURL=passport.js.map
