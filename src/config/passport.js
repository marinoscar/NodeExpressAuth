// Generated by CoffeeScript 1.9.1
(function() {
  var UserStore, localStrategy;

  localStrategy = require('passport-local').Strategy;

  UserStore = require('../services/userStore');

  module.exports = function(passport) {
    return passport.use('local', new localStrategy(function(username, password, done) {
      var store, user;
      store = new UserStore();
      user = store.find(username);
      if (user === null) {
        return done(null, false, {
          message: 'Invalid user'
        });
      }
      if (user.password !== password) {
        return done(null, false, {
          message: 'Invalid password'
        });
      }
      return done(null, user);
    }));
  };

}).call(this);

//# sourceMappingURL=passport.js.map
