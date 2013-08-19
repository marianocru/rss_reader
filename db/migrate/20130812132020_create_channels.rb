class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.string :url
      t.references :user

      t.timestamps
    end
    add_index :channels, :user_id
  end
end
