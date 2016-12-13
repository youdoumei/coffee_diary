class UsersController < ApplicationController
  def index
   @users = User.order("name")
  end

  def search
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save #ここ躓く
      redirect_to users_path, notice: "登録しました。"
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

end
