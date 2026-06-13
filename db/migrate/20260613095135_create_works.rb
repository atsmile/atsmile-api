class CreateWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :works do |t|
      t.string :slug
      t.string :title
      t.string :image
      t.text :description
      t.string :url
      t.string :anon_url
      t.string :link_label
      t.string :category
      t.string :basic_auth_user
      t.string :basic_auth_password
      t.boolean :public_only
      t.integer :position

      t.timestamps
    end
  end
end
