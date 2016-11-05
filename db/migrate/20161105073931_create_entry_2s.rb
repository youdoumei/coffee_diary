class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :entrynumber, null: false #投稿ナンバー
      #t.? :pic写真の添付
      t.integer :scale_templatenumber, null: false #指標テンプレート
      t.string :comment, null: false #コメント
      t.date :entrydate, null: false #投稿日
      #返信:
      t.integer :value1, null: false #評価1:苦味
      t.integer :value2, null: false #評価2：香り
      t.integer :value3, null: false #評価3：酸味
      t.integer :value4, null: false #評価4:コク
      t.timestamps null: false
    end
  end
end
