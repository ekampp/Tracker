require File.expand_path("../boot", __FILE__)

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
