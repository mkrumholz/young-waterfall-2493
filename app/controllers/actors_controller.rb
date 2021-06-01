class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    @coactors =  Actor.find_by_sql("select distinct(name) from actors 
                                    left join cast_members on cast_members.actor_id = actors.id 
                                    where movie_id in (select movie_id from cast_members where actor_id = #{@actor.id})
                                    and actors.id != #{@actor.id}")
  end 
end
