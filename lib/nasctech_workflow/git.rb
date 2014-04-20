class NasctechWorkflow::Git
  class << self
    def last_message
      `git log -1 --oneline`
    end

    def parse_ticket_number
      msg = last_message.strip
      $1.to_i if msg =~ /\s#(\d{4}):/
    end
  end
end
