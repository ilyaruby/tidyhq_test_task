class AddDefaultValueOfVisitedCountToLinks < ActiveRecord::Migration[7.1]
  def change
    change_column :links, :visit_count, :integer, default: 0, null: false
  end
end
