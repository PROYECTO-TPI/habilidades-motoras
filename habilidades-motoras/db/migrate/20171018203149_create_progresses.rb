class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :User_id
      t.integer :Publication_id

      t.timestamps null: false
    end
  end
end
