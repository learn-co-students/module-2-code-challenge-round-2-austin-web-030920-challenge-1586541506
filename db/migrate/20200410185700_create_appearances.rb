class CreateAppearances < ActiveRecord::Migration[5.1]
  def change
    create_table :appearances do |t|
      t.integer :guest_id, foreign_key: true
      t.integer :episode_id, foreign_key: true
      t.integer :rating, default: 1

      t.timestamps
    end

    add_index :appearances, [:guest_id, :episode_id], unique: true
  end
end
