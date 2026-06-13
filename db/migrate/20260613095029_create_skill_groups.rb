class CreateSkillGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :skill_groups do |t|
      t.string :label
      t.integer :position

      t.timestamps
    end
  end
end
