class EntriesController < ApplicationController
  #投稿一覧
  def index
   @entries = Entry.order("entrynumber")
  end

  def search
  end

  def show
    @entry = Entry.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image #picture
    else
      render "show"
    end
  end

  #新規投稿
  def new
    @entry = Entry.new
    #@entry.build_image #picture
  end

  def edit
    @entry = Entry.find(params[:id])
    @entry.build_picture unless @entry.imgae
  end

  def create
    @entry = Entry.new(entry_params)
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

  private
  def entry_params
    atts = [:entrynumber, :scale_templatenumber, :comment, :entrydate, :value1, :value2, :value3, :value4]
    atts << { image_attributes: [:_destroy, :id, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at] }
    params.require(:entry).permit(atts, :photo)
  #picture_attributes
  end


end
