class CreateProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :role
      t.string :role_ja
      t.string :location
      t.text :bio
      t.string :experience
      t.string :hobby
      t.string :now
      t.string :github

      t.timestamps
    end
  end
end
