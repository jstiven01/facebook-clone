class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.datetime :date_post

      t.timestamps
    end
  end
end
