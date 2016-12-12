class UsersController < ApplicationController
  def index
   @users = User.order("name")
  end

  def search
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
