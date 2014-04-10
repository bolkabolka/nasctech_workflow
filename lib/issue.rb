require File.expand_path('../base', __FILE__)

class Issue < Base
  PARENT_BRANCH = 16
  GUI_BRANCH = 14
  SERVER_BRANCH = 22

  schema do
    integer :assigned_to_id
    integer :status_id
  end

  def parent_branch
    self.custom_fields.find { |e| e.id == PARENT_BRANCH }.value
  end

  def set_branches
    self.custom_field_values = {}
    self.custom_field_values[GUI_BRANCH.to_s] = parent_branch
    self.custom_field_values[SERVER_BRANCH.to_s] = parent_branch
  end

  def resolve!(merged: true)
    if merged
      set_branches
    else
      self.notes = "Let's keep in branch"
    end

    self.status_id = 3
    self.assigned_to_id = 15
    save
  end
end
