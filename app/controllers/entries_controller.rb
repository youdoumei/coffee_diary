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
      send_picture
    else
      render "show"
    end
  end

  #新規投稿
  def new
    @entry = Entry.new
    @entry.build_picture
  end

  def edit
    @entry = Entry.find(params[:id])
    #@entry.build_picture unless @entry.imgae
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
    atts << { picture_attributes: [:_destroy, :id, :uploaded_picture] }
    params.require(:entry).permit(atts)
  end


  #画像送信
  def send_picture
    if @entry.picture.present?
      send_data @entry.picture.data,
        type: @entry.picture.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end
