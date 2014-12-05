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

    # fetches a conversation b/w 2 users
    # if there is no conversation it returns a new conversation
    # id with
    def self.get_conversation(recipient_id: nil, sender_id: nil, conversation_params: nil, conversation_id: nil)
      
      data = {
        'recipient_id' => recipient_id,
        'sender_id' => sender_id,
        'conversation_params' => conversation_params,
        # conversation_id is used when we only want to fetch a conversation
        # using its id
        'conversation_id' => conversation_id
      }
      data.delete_if {|k, v| v.blank? }

      Message.new.handle_request("conversations", :post, body: data)
    end

    def self.get_messages_from_conversation(conversation_id: nil)
      
      data = {
        'conversation_id' => conversation_id
      }
      
      # Message.new.handle_request("messages", :post, body: data)
      Message.new.handle_request("conversations/#{conversation_id}/messages", :get, body: data)
    end

    # fetches all conversations of a user
    def self.get_all_conversation
      # accepts 1 param s_id
    end
    
    def self.create_message(conversation_id: nil, message_params: nil, user_id: nil)
      
      data = {
        'message_params' => message_params,
        'conversation_id' => conversation_id,
        'user_id' => user_id
      }
      
      # /conversations/:conversation_id/messages/new
      Message.new.handle_request("conversations/#{conversation_id}/messages/new", :get, body: data)
    end
  end
end
