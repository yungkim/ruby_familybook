class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :child, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
