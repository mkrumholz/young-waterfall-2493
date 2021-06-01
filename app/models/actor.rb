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

  def coactors
    Actor.find_by_sql("select distinct(name) from actors 
                        left join cast_members on cast_members.actor_id = actors.id 
                        where movie_id in (select movie_id from cast_members where actor_id = #{id})
                        and actors.id != #{id}")
  end
end