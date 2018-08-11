class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_salt
      t.string :password_hash

      t.timestamps
    end
  end
end
