class AddIndexesToLinks < ActiveRecord::Migration[7.1]
  def change
    add_index :links, :short_url, unique: true
    add_index :links, :expires_at
  end
end
