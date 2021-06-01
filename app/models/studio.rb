class Studio < ApplicationRecord
  has_many :movies

  def actor_list
    Actor.studio_list(id)
  end
end
