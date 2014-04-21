require 'nasctech_workflow/base'
require 'nasctech_workflow/git'
require 'nasctech_workflow/time_entry'

module NasctechWorkflow
  class Issue < Base
    STATUSES = {
      in_progress: 2,
      resolved: 3,
      feedback: 4,
      redev: 9,
      pause: 6,
      on_hold_testing: 13,
      review: 15,
      feedback_sup: 17,
      escalation: 19
    }
    PARENT_BRANCH = 16
    GUI_BRANCH = 14
    SERVER_BRANCH = 22

    schema do
      integer :assigned_to_id
      integer :status_id
    end

    def gui_branch
      self.custom_fields.find { |e| e.id == GUI_BRANCH }.value.strip
    end

    def gui_branch_not_set?
      gui_branch.empty? ||
        gui.branch.eql?('-') ||
        gui_branch.eql?(parent_branch)
    end

    def parent_branch
      self.custom_fields.find { |e| e.id == PARENT_BRANCH }.value.strip
    end

    def set_branches
      self.custom_field_values = {}
      self.custom_field_values[GUI_BRANCH.to_s] = parent_branch
      self.custom_field_values[SERVER_BRANCH.to_s] = parent_branch
    end

    def progress!(branch: nil, duration: nil)
      if !branch && gui_branch_not_set?
        branch = NasctechWorkflow::Git.detect_branch_name
      end

      NasctechWorkflow::TimeEntry.log_development(id, duration) if duration

      self.custom_field_values[GUI_BRANCH.to_s] = branch if branch
      self.status_id = STATUSES[:in_progress]
      save
    end

    def resolve!(merged: true, duration: nil)
      if merged
        set_branches
      else
        self.notes = "Let's keep in branch"
      end

      NasctechWorkflow::TimeEntry.log_review(id, duration) if duration

      self.status_id = STATUSES[:resolved]
      self.assigned_to_id = 15
      save
    end
  end
end
