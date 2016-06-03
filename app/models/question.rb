class Question < ActiveRecord::Base
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
end
