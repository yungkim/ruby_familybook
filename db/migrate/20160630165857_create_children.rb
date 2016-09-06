class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.date :birthday
      t.string :gender
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
