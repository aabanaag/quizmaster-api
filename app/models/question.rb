class Question < ActiveRecord::Base
  before_save :format_answer

  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true

  def format_answer
    if is_number?(self.answer)
      self.answer = I18n.with_locale(:en) { Integer(self.answer).to_words }
    else
      self.answer = self.answer.downcase!
    end
  end

  private
  def is_number? string
    true if Float(string) rescue false
  end
end
