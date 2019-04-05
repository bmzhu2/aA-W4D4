class EditTitleColToTracks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracks, :title
    add_column :tracks, :title, :string, null: false, default: "(Untitled)"
  end
end
