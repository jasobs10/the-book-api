class RemoveSessionTokenNullConstraintUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :session_token, true
  end
end
