assert = require 'assert'
UserStore = require '../services/userStore'

describe 'using forms authentication', () ->
  it 'should create a valid default instance', () ->
    store = new UserStore()
    target = 'info@grokbit.com'
    assert.equal store.createInstance().email, target
  it 'should return a valid entity when credentials are valid', () ->
    store = new UserStore()
    target = 'info@grokbit.com'
    assert.equal store.find(target).email, target
  it 'should return a null entity when credentials are not valid', () ->
    store = new UserStore()
    assert.equal store.find('bad value'), null