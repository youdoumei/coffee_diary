class EntriesController < ApplicationController
  #投稿一覧
  def index
    @entries = Entry.order("entrynumber")
  end

  #投稿の詳細、編集
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
    @entry = Entry.find(params[:id])
    @entry.assign_attributes(entry_params)
    if @entry.save
      redirect_to entries_path, notice: "編集しました。"
    else
      render "edit"
    end
#    @entry.assign_attributes(params[:member])
#    if @entry.save
#      redirect_to @member, notice: "編集しました。"
#    else
#      render "edit"
#    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to :entries, notice: "投稿を削除しました"
  end

  private
    def entry_params
      atts = [:entrynumber, :price, :comment, :entrydate, :value1, :value2, :value3, :value4]
      atts << { image_attributes: [:_destroy, :id, :photo] }
      params.require(:entry).permit(atts)
    #picture_attributes
    end
  end
#20170223--植山
#エントリーテーブルに列追加するときは、entry_paramsのカラム名を変更する必要がある。
