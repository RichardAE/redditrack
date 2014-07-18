class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, :null => false, :default => ""
      t.string :name, :null => false, :default => ""
      t.integer :score, :null => false, :default => 0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
