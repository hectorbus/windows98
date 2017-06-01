class WelcomeController < ApplicationController
  def index

  end

  def fx
    render 'apps/fx'
  end

  def meme
    render 'apps/meme'
  end
end
