# Handles the incoming and outgoing messages with the messaging_service 
# exposes api endpoints.
module MessagingService
  class Message < BaseClient
    # this method is used to send a message to the messaging service
    def self.send(message, recipient_id, sender_id)
      data = {
        'recipient_id' => recipient_id,
        'sender_id' => sender_id,
        'message' => message
      }
      # All these fields are necessary add condition to validate that
      # all three fields are present.
      Message.new.handle_request("message", :post, body: data)
    end
  end
end
