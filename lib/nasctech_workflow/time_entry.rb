require 'nasctech_workflow/base'

module NasctechWorkflow
  class TimeEntry < Base
    ACTIVITIES = {
      testing: 10,
      review: 13,
      discussion: 14,
      design: 11,
      development: 12
    }

    schema do
      integer :issue_id
      string :hours
      integer :activity_id
      string :comments
    end

    def self.log_review(ticket_id, hours)
      create(issue_id: ticket_id,
             activity_id: ACTIVITIES[:review],
             hours: hours)
    end
  end
end
