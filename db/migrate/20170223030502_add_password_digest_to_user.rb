class AddPasswordDigestToUser < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :password_digest, :string
     add_column :users,  :list_friends, :integer, array:true, default: []
  end
end
