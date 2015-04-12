User = require('../models/user')

class UserStore
  find: (email) ->
    validUser = new User()
    validUser.email = 'info@grokbit.com'
    validUser.password = 'mypassword'
    validUser.name = 'Grokbit'
    return if email is 'info@grokbit.com' then validUser else null

module.exports = UserStore