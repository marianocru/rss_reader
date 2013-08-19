class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.string :description
      t.date :pubdate
      t.boolean :mark
      t.references :channel

      t.timestamps
    end
    add_index :articles, :channel_id
  end
end
