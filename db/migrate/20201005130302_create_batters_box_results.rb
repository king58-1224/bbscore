class CreateBattersBoxResults < ActiveRecord::Migration[6.0]
  def change
    create_table :batters_box_results do |t|
      t.integer      :position_number,    null: false
      t.integer      :batters_box_id,     null: false
      t.timestamps
    end
  end
end
