# Description:
#   Shotgun ticket link looks for #nnn and links to that ticket.
#
# Dependencies:
#
# Configuration:
#   HUBOT_ZENDESK_TICKET_URL
#   HUBOT_SG_ISSUE_LINK_IGNORE_USERS
#
# Commands:
#   #nnn 
#     - link to Zendesk ticket nnn for HUBOT_ZENDESK_TICKET_URL
#     - link to ZendeskTicket associated with nnn on for HUBOT_SHOTGUN_URL
#
# Notes:
# 
#
# Author:
#   neilvictorgrey

module.exports = (robot) ->
  githubIgnoreUsers = process.env.HUBOT_SG_ISSUE_LINK_IGNORE_USERS
  if githubIgnoreUsers == undefined
    githubIgnoreUsers = "hubot"

  robot.hear /\s+ZD#(\d+)/i, (msg) ->
    return if msg.message.user.name.match(new RegExp(githubIgnoreUsers, "gi"))
    
    ticket_number = msg.match[1]
    if isNaN(ticket_number)
      return
    
    zendesk_url = process.env.HUBOT_ZENDESK_TICKET_URL
    msg.send "#{zendesk_url}#{ticket_number}"
