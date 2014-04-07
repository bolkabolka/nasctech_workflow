require './lib/base'

class Issue < Base
  schema do
    integer :assigned_to_id
    integer :status_id
  end

  def include_root_in_json
    true
  end

  def reviewed!
    self.status_id = 3
    self.assigned_to_id = 15
    save
  end
end
