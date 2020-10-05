class CreateBattingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :batting_orders do |t|
      t.integer     :game_id,        null: false
      t.integer     :member_id,      null: false
      t.integer     :batting_number, null: false
      t.integer     :position_id,    null: false

      t.timestamps
    end
  end
end
