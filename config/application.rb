require File.expand_path("../boot", __FILE__)

# Setup connection to db
require 'active_record'
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.configurations = YAML::load(IO.read(Lattice.root.join('config', 'database.yml')))
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'])

# Require your resources here
require 'resources/objects'

module Tracker
  Application = Lattice::Application.new do |app|
    app.routes do
      add ['*'], Resources::Objects
    end
  end
end

Lattice.app = Tracker::Application
