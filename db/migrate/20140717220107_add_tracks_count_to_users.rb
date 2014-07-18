class AddTracksCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tracks_count, :integer, :null => false, :default => 0
  end
end
