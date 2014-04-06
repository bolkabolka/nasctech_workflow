require './lib/base'

class Issue < Base
  def reviewed!
    status_id = 3
    assigned_to_id = 15
    save
  end
end
