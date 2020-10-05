class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer    :team_id,           null: false,foreign_key: true
      t.integer    :uniform_number,    null: false
      t.string     :grade,             null: false
      t.string     :first_name,        null: false
      t.string     :last_name,         null: false
      t.timestamps
    end
  end
end
