require 'rubygems'
require 'thin'
require 'usher'
require 'erb'
require 'cramp/controller'
require 'cramp/model'
require 'active_support/all'
require 'active_support/json'

require 'config/routes'
require 'app/helpers/application'
require 'app/controllers/application_controller'
require 'app/controllers/chat_controller'
require 'app/controllers/retrieve_controller'
require 'app/controllers/receive_controller'
require 'app/controllers/static_controller'
require 'app/models/chat'
require 'lib/fixes'

Cramp::Model.init(YAML.load(File.read('./config/database.yml')))
Cramp::Controller::Websocket.backend = :thin
Thin::Logging.trace = true
Rack::Handler::Thin.run app_routes, :Port => 3000