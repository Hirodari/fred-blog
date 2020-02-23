class FixColumnNameUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :secure_digest, :password_digest
  end
end
