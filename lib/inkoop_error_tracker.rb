require "inkoop_error_tracker/version"
require "net/http"

module InkoopErrorTracker
  class Tracker

    @@api_key = nil
    
    def self.api_key=(api_key)
      @@api_key = api_key
    end

    def self.track error, parameters={}
      if @@api_key
        uri = URI('http://error.inkoop.in/errors')
        message = "#{error.message} - #{error.backtrace[0]}"
        description = error.backtrace.join('\n')
        res = Net::HTTP.post_form(
                uri, 
                'message'     => message, 
                'project_api' => @@api_key, 
                'description' => description,
                'parameters'  => parameters
              )
      end
    end

  end
end
