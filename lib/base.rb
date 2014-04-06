require 'rubygems'
require 'bundler/setup'
require 'yaml'

Bundler.require(:default)

class Base < ActiveResource::Base

  YAML.load_file('config/redmine.yml').each do |key, value|
    self.send("#{key}=", value)
  end

end
