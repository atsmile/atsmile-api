class CreateWorkTags < ActiveRecord::Migration[8.1]
  def change
    create_table :work_tags do |t|
      t.references :work, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
