class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciver_id
      t.string :body
      t.datetime :read_at

      t.timestamps
    end
  end
end
