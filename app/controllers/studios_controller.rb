class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @actors = @studio.actor_list
  end
end