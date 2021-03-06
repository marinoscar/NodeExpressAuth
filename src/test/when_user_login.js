// Generated by CoffeeScript 1.9.1
(function() {
  var UserStore, assert;

  assert = require('assert');

  UserStore = require('../services/userStore');

  describe('using forms authentication', function() {
    it('should create a valid default instance', function() {
      var store, target;
      store = new UserStore();
      target = 'info@grokbit.com';
      return assert.equal(store.createInstance().email, target);
    });
    it('should return a valid entity when credentials are valid', function() {
      var store, target;
      store = new UserStore();
      target = 'info@grokbit.com';
      return assert.equal(store.find(target).email, target);
    });
    return it('should return a null entity when credentials are not valid', function() {
      var store;
      store = new UserStore();
      return assert.equal(store.find('bad value'), null);
    });
  });

}).call(this);

//# sourceMappingURL=when_user_login.js.map
