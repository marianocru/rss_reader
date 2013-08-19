class AddGuidToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :guid, :integer
  end
end
