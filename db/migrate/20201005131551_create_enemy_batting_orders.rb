class CreateEnemyBattingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_batting_orders do |t|
      t.integer      :game_id,          null: false
      t.integer      :enemy_member_id,  null: false
      t.integer      :batting_number,   null: false
      t.integer      :position_id,      null: false
      t.timestamps
    end
  end
end
