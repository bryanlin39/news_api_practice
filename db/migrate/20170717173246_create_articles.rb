class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :location_id
      t.string :url
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
