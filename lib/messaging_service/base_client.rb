module MessagingService
  class BaseClient
    # Makes request to the Messaging service
    def handle_request(url, http_verb, body: nil)
      begin
        result = MessagingService.connection.send(http_verb.to_s) do |request|
          request.url url 
          request.headers['Content-Type'] = 'application/json'
          request.params = params if params.present?
          request.body = body.to_json if body.present?
          request.options[:timeout] = 120 
        end
        handle_result(result)
      rescue => ex
        Rollbar.log(ex, {:env => {:url => url,
                                  :http_verb=> http_verb,
                                  :params => params,
                                  :body => body}
        }) 
        # if account_uuid.nil? || !AppConfig.user_tracking_service.ignore_error_reporting_on_accounts.include?(account_uuid)
        raise # reraise
      end 
    end

    # Handles the response from Messaging service
    def handle_response(response)
      raise Net::HTTPError.new("Messaging Service returned http error #{response.body}", response.status) if response.status != 200
      Hashie::Mash.new(result.body)
    end
  end
end
