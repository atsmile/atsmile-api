class CreateCareers < ActiveRecord::Migration[8.1]
  def change
    create_table :careers do |t|
      t.string :period
      t.string :title
      t.text :description
      t.boolean :is_current

      t.timestamps
    end
  end
end
