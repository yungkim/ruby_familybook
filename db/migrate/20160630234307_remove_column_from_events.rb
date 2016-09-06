class RemoveColumnFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :child_id
  end
end
