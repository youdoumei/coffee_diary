class EntriesController < ApplicationController
  #投稿一覧
  def index
   @entries = Entry.order("entrynumber")
  end

  def search
  end

  def show
  end

  #新規投稿
  def new
    @entries = Entry.new
  end

  def edit
    @entries = Entry.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

end
