class AddUsersNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end
