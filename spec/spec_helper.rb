$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

Bundler.setup
require 'kramdown'
require 'capybara/poltergeist'
require 'capybara/rspec'

require 'i_give_you_index'

Capybara.app = IGiveYouIndex.new
# Capybara.javascript_driver = :poltergeist