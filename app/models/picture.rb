class Picture < ActiveRecord::Base
  belongs_to :entry

  attr_reader :uploaded_picture

  PICTURE_TYPES =
   { "picture/jpeg" => "jpg", "picture/gif" => "gif", "picture/png" => "png" }

  def extension
    PICTURE_TYPES[content_type]
  end

  def uploaded_picture=(picture)
    self.content_type = convert_content_type(picture.content_type)
    self.data = picture.read
    @uploaded_picture = picture
  end

  private
  def convert_content_type(ctype)
    ctype = ctype.rstrip.downcase
    case ctype
      when "picture/pjpeg" then "picture/jpeg"
      when "picture/jpg" then "picture/jpeg"
      when "picture/x-png" then "picture/png"
      else ctype
    end
  end
end
# photoをattachファイルとする。stylesで画像サイズを定義できる
#  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }

# ファイルの拡張子を指定（これがないとエラーが発生する）
#  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
#end
