class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @actors = Actor.joins(:movies).where(movies: {studio_id: @studio.id}).where(currently_working: true).order(age: :desc)
  end
end