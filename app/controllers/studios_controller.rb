class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @actors = Actor.studio_list(@studio.id)
  end
end