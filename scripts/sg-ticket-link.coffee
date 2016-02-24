# Description:
#   Shotgun ticket link looks for #nnn and links to that ticket.
#
# Dependencies:
#
# Configuration:
#   HUBOT_SHOTGUN_URL
#   HUBOT_ZENDESK_TICKET_URL
#   HUBOT_GITHUB_URL
#   HUBOT_SG_ISSUE_LINK_IGNORE_USERS
#
# Commands:
#   #nnn - link to Shotgun ticket nnn on HUBOT_SHOTGUN_URL
#   zd#nnn - link to Zendesk ticket nnn on HUBOT_ZENDESK_TICKET_URL
#   pr#nnn - link to Github pull-request nnn on HUBOT_GITHUB_URL
#
# Notes:
#   Ticket prefixes are case insensitive.
#
# Author:
#   brandonvfx
#   nemoDreamer
#   neilvictorgrey

module.exports = (robot) ->

  githubIgnoreUsers = process.env.HUBOT_SG_ISSUE_LINK_IGNORE_USERS
  if githubIgnoreUsers == undefined
    githubIgnoreUsers = "hubot"

  urls =
    shotgun: "#{process.env.HUBOT_SHOTGUN_URL}/detail/Ticket"
    zendesk: "#{process.env.HUBOT_ZENDESK_TICKET_URL}"
    github: "#{process.env.HUBOT_GITHUB_URL}/pull"

  robot.hear /\s+(.*)#(\d+)/i, (msg) ->
    return if msg.message.user.name.match(new RegExp(githubIgnoreUsers, "gi"))

    [match, prefix, number] = msg.match

    return if isNaN(number)

    mode = switch
      when /zd/i.test prefix then 'zendesk'
      when /pr/i.test prefix then 'github'
      else 'shotgun'

    msg.send "#{urls[mode]}/#{number}"
