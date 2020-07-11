class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end

  #importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      tweet = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      tweet.attributes = row.to_hash.slice(*updatable_attributes)
      tweet.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "text", "image", "created_at", "updated_at", "user_id", "name", "adress","area"]
  end
end
