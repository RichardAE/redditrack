class AddLastScoreToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :first_score, :integer, :null => false, :default => 0
  end
end
