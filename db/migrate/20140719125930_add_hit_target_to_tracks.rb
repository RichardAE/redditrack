class AddHitTargetToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :hit_target, :integer, :null => false, :default => 0
  end
end
