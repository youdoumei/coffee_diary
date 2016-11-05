class EntriesController < ApplicationController
  #投稿一覧
  def index
   @entries = Entry.order("number")
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
