class WelcomeController < ApplicationController

  def index
    redirect_to todo_items_path
  end
end
