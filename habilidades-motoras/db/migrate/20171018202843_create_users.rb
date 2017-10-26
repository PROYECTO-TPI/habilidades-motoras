class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :password
      t.string :type
      t.string :confirmation_token

      t.timestamps null: false
    end
  end
end
