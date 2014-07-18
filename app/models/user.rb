class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :recoverable, :validatable, :trackable,

  devise :database_authenticatable, :registerable,
          :rememberable, :omniauthable

  has_many :tracks
end
