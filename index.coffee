yaml = require 'js-yaml'
extend = require 'extend'
loadSecrets = require 'yael-autoencrypt'
cache = null
module.exports = (options) ->
  return cache if (not options?) and cache?
  all_secrets = yaml.safeLoad loadSecrets(options)
  cache = {}
  extend cache, all_secrets['common'], all_secrets[process.env.NODE_ENV]
  return cache
