# Handles the incoming and outgoing messages with the messaging_service 
# exposes api endpoints.
module MessagingService
  class Message < BaseClient
    # this method is used to send a message to the messaging service
    def self.send_message(message, recipient_id, sender_id)
      
      data = {
        'recipient_id' => recipient_id,
        'sender_id' => sender_id,
        'message' => message
      }
      # All these fields are necessary add condition to validate that
      # all three fields are present.
      Message.new.handle_request("songs", :post, body: data)
    end

    # recieves messages from the Messaing service
    # think if we need this?
    def self.recieve_message
      
    end

    # fetches a conversation b/w 2 users
    def self.get_conversation
      # accepts 2 params s_id and r_id
    end

    # fetches all conversations of a user
    def self.get_all_conversation
      # accepts 1 param s_id
    end
  end
end
