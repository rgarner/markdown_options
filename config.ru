$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'stupid_web_server'

run StupidWebServer.new
