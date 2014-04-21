require 'nasctech_workflow/base'
require 'nasctech_workflow/time_entry'

module NasctechWorkflow
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

    def resolve!(merged: true, duration: nil)
      if merged
        set_branches
      else
        self.notes = "Let's keep in branch"
      end

      NasctechWorkflow::TimeEntry.log_review(id, duration) if duration

      self.status_id = 3
      self.assigned_to_id = 15
      save
    end
  end
end
