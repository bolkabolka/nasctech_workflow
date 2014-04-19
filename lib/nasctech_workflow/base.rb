require 'yaml'

class NasctechWorkflow::Base < ActiveResource::Base

  CONFIG = File.join(File.expand_path('~/'), '.nasctech_workflow.yml')

  YAML.load_file(CONFIG)['redmine'].each do |key, value|
    self.send("#{key}=", value)
  end

  def include_root_in_json
    true
  end

end
