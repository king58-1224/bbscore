class CreateEnemyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_reports do |t|
      t.integer       :enemy_batting_order_id,  null: false
      t.integer       :inning_name_id,          null: false
      t.integer       :batters_box_result_id,   null: false
      t.integer       :ball_count,              null: false
      t.integer       :score_point,             null: false
      t.timestamps
    end
  end
end
