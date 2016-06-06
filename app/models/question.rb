class Question < ActiveRecord::Base
  before_save :downcase_fields

  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true

  def downcase_fields
    self.answer.downcase!
  end

end
