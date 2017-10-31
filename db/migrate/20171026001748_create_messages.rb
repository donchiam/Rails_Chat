class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :chat, foreign_key: true

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
  end
end
