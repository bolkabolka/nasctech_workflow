require 'yaml'

class NasctechWorkflow::Base < ActiveResource::Base

  YAML.load_file(File.join(File.expand_path('~/'), '.nasctech_workflow.yml')).each do |key, value|
    self.send("#{key}=", value)
  end

  def include_root_in_json
    true
  end

end
