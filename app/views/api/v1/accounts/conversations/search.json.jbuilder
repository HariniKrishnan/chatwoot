json.meta do
  json.mine_count @conversations_count[:mine_count]
  json.unassigned_count @conversations_count[:unassigned_count]
  json.all_count @conversations_count[:all_count]
end
json.payload do
  json.array! @conversations do |conversation|
    json.id conversation.display_id
    json.messages do
      json.array! conversation.messages do |message|
        json.content message.content
        json.id message.id
        json.sender_name message.sender.name if message.sender
        json.message_type message.message_type_before_type_cast
        json.created_at message.created_at.to_i
      end
    end
    json.account_id conversation.account_id
  end
end
