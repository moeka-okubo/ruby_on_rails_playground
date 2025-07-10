class Task < ApplicationRecord
  validates :title,
    presence: { message: "タイトルを入力してください" },
    length: { minimum: 3, message: "タイトルは3文字以上で入力してください" }
  validates :description, length: { maximum: 100, message: "内容は100文字以下で入力してください" }
end
