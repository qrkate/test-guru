class AddColumnHashIdToGists < ActiveRecord::Migration[6.1]
  def change
    add_column :gists, :url_hash, :string
  end
end
