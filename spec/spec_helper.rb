$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

Bundler.setup
require 'kramdown'
require 'capybara/poltergeist'
require 'capybara/rspec'

require 'stupid_web_server'

Capybara.app = StupidWebServer.new
# Capybara.javascript_driver = :poltergeist