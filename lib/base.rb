require 'yaml'

class Base < ActiveResource::Base

  YAML.load_file('config/redmine.yml').each do |key, value|
    self.send("#{key}=", value)
  end

  def include_root_in_json
    true
  end

end
