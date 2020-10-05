class CreateEnemyMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_members do |t|
      t.integer    :enemy_team_id,    null: false
      t.integer    :uniform_number,   null: false
      t.string     :first_name,       null: false
      t.string     :last_name,        null: false
      t.timestamps
    end
  end
end
