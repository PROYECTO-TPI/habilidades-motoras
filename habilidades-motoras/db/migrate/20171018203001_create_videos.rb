class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :video_id
      t.string :url

      t.timestamps null: false
    end
  end
end
