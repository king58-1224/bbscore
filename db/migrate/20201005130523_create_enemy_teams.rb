class CreateEnemyTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_teams do |t|
      t.integer         :game_id,   null: false
      t.string          :team_name, null: false
      t.timestamps
    end
  end
end
