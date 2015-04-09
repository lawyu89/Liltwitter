class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :minion_id
      t.integer :leader_id

      t.timestamps
    end
  end
end
