// Generated by CoffeeScript 1.9.1
(function() {
  var account, app, bodyParser, cookieParser, express, favicon, flash, logger, morgan, passport, path, routes, session, users;

  express = require('express');

  path = require('path');

  favicon = require('serve-favicon');

  logger = require('morgan');

  cookieParser = require('cookie-parser');

  bodyParser = require('body-parser');

  routes = require('./routes/index');

  users = require('./routes/users');

  account = require('./routes/account');

  passport = require('passport');

  morgan = require('morgan');

  flash = require('connect-flash');

  cookieParser = require('cookie-parser');

  bodyParser = require('body-parser');

  session = require('express-session');

  app = express();

  app.set('views', path.join(__dirname, 'views'));

  app.set('view engine', 'hbs');

  app.use(logger('dev'));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: false
  }));

  app.use(cookieParser());

  app.use(morgan('dev'));

  app.use(session({
    secret: 'mygithubauthsecretkey'
  }));

  app.use(passport.initialize());

  app.use(passport.session());

  app.use(flash());

  app.use(express["static"](path.join(__dirname, 'public')));

  app.use('/bower_components', express["static"](path.join(__dirname, '/bower_components')));

  app.use('/', routes);

  app.use('/users', users);

  app.use('/account', account);

  app.use(function(req, res, next) {
    var err;
    err = new Error('Not Found');
    err.status = 404;
    return next(err);
  });

  if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
      res.status(err.status || 500);
      return res.render('error', {
        message: err.message,
        error: err
      });
    });
  }

  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    return res.render('error', {
      message: err.message,
      error: {}
    });
  });

  module.exports = app;

}).call(this);

//# sourceMappingURL=app.js.map
