class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer    :game_id,     null: false,foreign_key: true
      t.references  :member_id,   null: false
      t.references  :position_id, null: false
      t.timestamps
    end
  end
end
