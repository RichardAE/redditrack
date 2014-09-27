class Track < ActiveRecord::Base
  belongs_to :user, counter_cache: true, touch: true

  validates_length_of :title, maximum: 255
  validates_length_of :name, maximum: 255
  validates_numericality_of :score, only_integer: true, on: :create
  validates_numericality_of :first_score, only_integer: true, on: :create
  validates_numericality_of :target_score, only_integer: true, on: :create

  validate :existing_track, on: :create

  def existing_track
    if Track.exists?(name: self.name, user_id: self.user_id)
      errors.add(:base, "You are already tracking this")
    end
  end
end
