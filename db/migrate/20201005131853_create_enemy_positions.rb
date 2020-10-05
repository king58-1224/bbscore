class CreateEnemyPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_positions do |t|
      t.integer      :game_id,           null: false,foreign_key: true
      t.references   :enemy_member_id,   null: false
      t.references   :position_id,       null: false
      t.timestamps
    end
  end
end
