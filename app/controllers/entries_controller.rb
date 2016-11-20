class EntriesController < ApplicationController
  #投稿一覧
  def index
   @entries = Entry.order("entrynumber")
  end

  def search
  end

  def show
    @entry = Entry.find(params[:id])
  end

  #新規投稿
  def new
    @entries = Entry.new
  end

  def edit
    @entries = Entry.find(params[:id])
  end

  def create
    @entry = Entry.new(params[:entry])
     if @entry.save
       redirect_to entries_path, notice: "投稿しました。"
     else
       render "new"
     end
  end

  def update
  end

  def destroy
  end

end
