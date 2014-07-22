class AddPermalinkToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :permalink, :string, null: false, default: ""
  end
end
