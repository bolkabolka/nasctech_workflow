class NasctechWorkflow::Git
  class << self
    def branch_name
      `git rev-parse --abbrev-ref HEAD`.strip
    end

    def last_message
      `git log -1 --oneline`.strip
    end

    def detect_branch_name
      branch = branch_name
      return if branch.empty?

      if agree("Should i set GUI branch to #{branch}?")
        branch
      end
    end

    def detect_ticket_number
      confirm_ticket_id(last_message.scan(/\s#(\d{4})/).flatten) ||
        confirm_ticket_id(branch_name.scan(/\d{4}/))
    end

    def confirm_ticket_id ticket_ids
      return if ticket_ids.empty?

      if ticket_ids.size.eql?(1)
        if agree("I'm going to update ticket ##{ticket_ids.first}, ok")
          return ticket_ids.first
        else
          return
        end
      end

      choose do |menu|
        menu.prompt = 'Select ticket ID: '
        menu.choices(*ticket_ids) do |ticket_id|
          return ticket_id
        end
        menu.choice 'No one of above' do
          return
        end
      end
    end
  end
end
