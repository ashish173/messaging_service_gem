module MessagingService
  class BaseClient
    # Makes request to the Messaging service
    def handle_request(url, http_verb, body: nil)
      begin
        result = MessagingService.connection.send(http_verb.to_s) do |request|
          request.url url 
          request.headers['Content-Type'] = 'application/json'
          # request.params = params if params.present?
          request.body = body.to_json if body.present?
          request.options[:timeout] = 120 
        end
        handle_response(result)
      rescue => ex
        puts "Exception raised #{ex}"
        raise # reraise
      end 
    end

    # Handles the response from Messaging service
    def handle_response(response)
      raise Net::HTTPError.new("Messaging Service returned http error #{response.body}", response.status) if response.status != 200
      Hashie::Mash.new(response.body)
    end
  end
end
