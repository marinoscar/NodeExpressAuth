#loading dependencies
express = require 'express'
path = require 'path'
favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'

#routes
index = require './routes/index'
users = require './routes/users'
account = require './routes/account'
account = require './routes/account'
defaultRoute = require './routes/defaultRoute'

#authentication
passport = require 'passport'
morgan = require 'morgan'
flash = require 'connect-flash'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
session = require 'express-session'

app = express()

app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'hbs')

app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

#auth middleware
require('./config/passport')(passport)
app.use(cookieParser())
app.use(morgan('dev'))
app.use(session({ secret: 'mygithubauthsecretkey' }))
app.use(passport.initialize())
app.use(passport.session())
app.use(flash())


app.use(express.static(path.join(__dirname, 'public')))
app.use('/bower_components',  express.static((path.join(__dirname,'/bower_components'))))

# anonymous routes
app.use('/account', account)

# protected routes
app.use((req, res, next) ->
  console.log("checking for authentication")
  if req.isAuthenticated()
    return next()
  req.session.error = 'Please sign in!'
  res.redirect('/account/login')
)

#route init
app.use('/', index)
app.use('/users', users)



#error routes
app.use((req, res, next) ->
  err = new Error('Nothing here, sorry')
  err.status = 404
  next(err)
)

if (app.get('env') is 'development')
  app.use((err, req, res, next) ->
    res.status(err.status or 500);
    res.render('error', { message: err.message, error: err})
  )

app.use((err, req, res, next) ->
  res.status(err.status or 500);
  res.render('error', { message: err.message, error: {}})
)

module.exports = app
