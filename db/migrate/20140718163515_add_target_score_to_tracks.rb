class AddTargetScoreToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :target_score, :integer
  end
end
