class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.integer :ord
      t.text :lyrics
      t.boolean :bonus
      t.timestamps
    end

    add_index :tracks, :album_id
  end
end
