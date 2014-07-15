class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :recoverable, :validatable
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :omniauthable

end
