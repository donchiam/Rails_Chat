json.extract! chat, :id, :name, :password, :image, :created_at, :updated_at
json.url chat_url(chat, format: :json)
