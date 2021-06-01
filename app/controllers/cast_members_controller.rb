class CastMembersController < ApplicationController
  def create
    movie = Movie.find(params[:id])
    actor = Actor.where(name: params[:name])[0]
    cast_member = CastMember.create!(movie_id: movie.id, actor_id: actor.id)
    cast_member.save

    redirect_to "/movies/#{movie.id}"
  end
end