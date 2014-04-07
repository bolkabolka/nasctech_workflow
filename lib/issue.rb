require './lib/base'

class Issue < Base
  schema do
    integer :assigned_to_id
    integer :status_id
  end

  def include_root_in_json
    true
  end

  def merged
    self.custom_field_values = { '14' => 'develop' }
  end

  def reviewed!
    merged
    self.status_id = 3
    self.assigned_to_id = 15
    save
  end
end
