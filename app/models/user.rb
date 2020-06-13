class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

    def slug_candidates
      [
        ["#{User.all.count + 1}"], 
        ["#{User.all.count + 1}", "#{User.all.count + 1}"]
      ]
    end
    
end
