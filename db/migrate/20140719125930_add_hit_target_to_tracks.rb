class AddHitTargetToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :hit_target, :boolean, :null => false, :default => false
  end
end
