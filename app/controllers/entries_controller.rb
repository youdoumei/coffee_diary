class EntriesController < ApplicationController
  #投稿一覧
  def index
   @entries = Entry.order("entrynumber")
  end

  def search
  end

  def show
    @entries = Entry.find(params[:entry])
  end

  #新規投稿
  def new
    @entries = Entry.new
  end

  def edit
    @entries = Entry.find(params[:id])
  end

  def create
    @entries = Entry.new(params[:entry])
     if @entries.save
       redirect_to @entries, notice: "投稿しました。"
     else
       render "new"
     end
  end

  def update
  end

  def destroy
  end

end
