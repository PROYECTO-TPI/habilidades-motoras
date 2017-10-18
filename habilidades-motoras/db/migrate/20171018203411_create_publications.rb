class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.integer :rol
      t.string :title
      t.string :type
      t.text :description

      t.timestamps null: false
    end
  end
end
