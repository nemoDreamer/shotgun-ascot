# Description:
#   Debuggin info
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot debug - Debugging output
#
# Author:
#   nemodreamer

Util = require 'util'

Object::debug = ->
  ("#{key}: #{value}" if key is not 'debug') for key, value of @

module.exports = (robot) ->

  robot.respond /debug/i, (msg) ->
    # msg.reply "\nmsg.message.user\n", msg.message.user.debug().join "\n"
    # console.log ("#{user.data.name}" for id, user of @robot.brain.users()).join "\n"
    msg.send "#{Util.inspect @robot.brain.users()}"
