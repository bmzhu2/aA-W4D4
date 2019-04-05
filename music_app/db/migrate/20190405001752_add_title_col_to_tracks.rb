class AddTitleColToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :title, :string
  end
end
