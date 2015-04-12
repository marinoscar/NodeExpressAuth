// Generated by CoffeeScript 1.9.1
(function() {
  var express, isLoggedIn, router;

  express = require('express');

  router = express.Router();

  router.get('/login', function(req, res, next) {
    return res.render('account/login', {
      title: 'Github Auth'
    });
  });

  isLoggedIn = function(req, res, next) {
    if (req.isAuthenticated()) {
      return next();
    }
    return res.redirect('/');
  };

  module.exports = router;

}).call(this);

//# sourceMappingURL=account.js.map