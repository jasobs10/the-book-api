class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, force: true do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :f_name
      t.string :l_name
      t.string :motto
      t.boolean :receive_emails, default: false
      t.integer :current_points, default: 0
      t.string :access_type, default: "user"

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
    add_index :users, :session_token
  end
end
