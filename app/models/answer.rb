class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :likes

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :question_id, presence: true, numericality: {only_integer: true}
  validates :content, presence: true

end
