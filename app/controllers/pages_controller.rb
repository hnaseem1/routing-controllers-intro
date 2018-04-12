class PagesController < ApplicationController
  before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "This is the welcome page"
  end

  def about
    @header = "This is the about page"
  end

  def contest
    # @header = "This is a contest page"
    # render :contest

    flash[:notice] = "Sorry, the contest has ended"
    redirect_to root_path
  end

  def kitten
  end

  def kittens
  end

  def secrets
    if params[:magic_word] != "guru"
      flash[:alert] = "Sorry, you're not authorized to see that page!"
      render :welcome
    end
  end

  def set_kitten_url
    requested_size = params[:size]
    @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
  end
end
