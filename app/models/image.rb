class Image < ActiveRecord::Base
  belongs_to :entry

  has_attached_file :photo,
  :styles => { medium: "300x300>", thumb: "100x100>" }, # 画像サイズを指定
 	:url  => "/assets/images/:id/:style/:basename.:extension", # 画像保存先のURL先
 	:path => "#{Rails.root}/public/assets/images/:id/:style/:basename.:extension" # サーバ上の画像保存先パス

  # ファイルの拡張子を指定（これがないとエラーが発生する）
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  ## Validation
  validates_attachment :photo,
    presence: true,  # ファイルの存在チェック
    less_than: 5.megabytes # ファイルサイズのチェック
end
