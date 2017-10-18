class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :tip_id
      t.text :description

      t.timestamps null: false
    end
  end
end
