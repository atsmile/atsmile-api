class CreateSkills < ActiveRecord::Migration[8.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :level
      t.integer :position
      t.references :skill_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
