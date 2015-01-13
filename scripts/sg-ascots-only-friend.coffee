# Description:
#   Ascot needs some love too...
#
# Configuration:
#   None
#
# Commands:
#   hubot who loves you - See Ascot's gentle side.
#
# Author:
#   nemodreamer

module.exports = (robot) ->

  corgi_in_a_tuxedo = [
    'https://img0.etsystatic.com/006/0/6415312/il_570xN.352852018_8rh0.jpg'
    'http://24.media.tumblr.com/tumblr_m8d2cfhiG11rd0j11o5_1280.jpg'
    'http://hhildrethphoto.files.wordpress.com/2010/10/mg_3712.jpg'
    'https://s-media-cache-ak0.pinimg.com/236x/ab/ac/aa/abacaab5929df8c92c64328c02cbf629.jpg'
  ]

  robot.respond /who loves you\??/i, (msg) ->
    msg.send msg.random corgi_in_a_tuxedo
