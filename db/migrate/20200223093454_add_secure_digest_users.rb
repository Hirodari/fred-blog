class AddSecureDigestUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :secure_digest, :string 
  end
end
