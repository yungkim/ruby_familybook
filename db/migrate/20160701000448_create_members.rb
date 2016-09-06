class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :child, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
