class CreateSuggestedPosts < ActiveRecord::Migration
  def change
    create_table :suggested_posts do |t|
      t.integer :form_id
      t.integer :publication_id

      t.timestamps null: false
    end
  end
end
