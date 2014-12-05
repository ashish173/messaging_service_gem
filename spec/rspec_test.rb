require 'spec_helper'

RSpec.describe MessagingService, type: :lib do

  describe "#.send_message" do
    it "assigns argument data into data hash"
    it "makes request to the messaging service"
  end

  describe "#.get_conversation" do
    it "fetches a conversation b/w 2 users given s_id and r_id"
  end

  describe "#.get_all_conversations" do
    it "will fetch all conversations of user given its id"
  end
end
