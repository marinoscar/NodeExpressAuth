User = require('../models/user')

class UserStore
  find: (email) ->
    return if email is 'info@grokbit.com' then @createInstance() else null

  findByKey: (key) ->
    return if key is 'info@grokbit.com' then @createInstance() else null

  createInstance: () ->
    validUser = new User()
    validUser.email = 'info@grokbit.com'
    validUser.providerKey = validUser.email
    validUser.password = 'mypassword'
    validUser.name = 'Grokbit'
    return validUser

module.exports = UserStore