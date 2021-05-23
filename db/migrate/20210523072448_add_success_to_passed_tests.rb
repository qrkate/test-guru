class AddSuccessToPassedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :passed_tests, :success, :boolean, default: false
  end
end
