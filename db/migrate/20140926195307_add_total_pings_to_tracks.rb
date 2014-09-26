class AddTotalPingsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :total_pings, :integer, null: false, default: 0
  end
end
