class Actor < ApplicationRecord
  has_many :cast_members, dependent: :destroy
  has_many :movies, through: :cast_members

  def self.studio_list(studio_id)
    self.joins(:movies)
        .where(movies: {studio_id: studio_id})
        .where(currently_working: true)
        .order(age: :desc)
        .distinct
  end
end