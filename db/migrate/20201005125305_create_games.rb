class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer      :team_id,     null: false,foreign_key: true
      t.string       :game_name,   null: false
      t.date         :game_day,    null: false
      t.timestamps
    end
  end
end
