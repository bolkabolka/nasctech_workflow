class NasctechWorkflow::Git
  class << self
    def branch_name
      `git rev-parse --abbrev-ref HEAD`.strip
    end

    def last_message
      `git log -1 --oneline`.strip
    end

    def parse_ticket_number
      $1.to_i if last_message =~ /\s#(\d{4}):/
    end
  end
end
