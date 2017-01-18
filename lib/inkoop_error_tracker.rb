require "inkoop_error_tracker/version"
# require "inkoop_error_tracker/tracker"

module InkoopErrorTracker
  # Your code goes here...
  class Tracker
    
    def self.api_key=(api_key)
      @@api_key = api_key
    end

    def track
      uri = URI('http://localhost:3000/errors')
      res = Net::HTTP.post_form(uri, 'message' => 'mes', 'project_api' => @@api_key, 'description' => 'some description')
    end

  end
end
