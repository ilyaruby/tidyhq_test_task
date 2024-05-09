class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :short_url
      t.integer :visit_count
      t.datetime :expires_at

      t.timestamps
    end
  end
end
