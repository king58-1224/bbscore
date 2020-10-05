class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team,     null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
