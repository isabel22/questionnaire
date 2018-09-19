class Document
  include Mongoid::Document
  field :title, type: String

  has_many :questions, dependent: :destroy

  def has_answers?
    question_ids = Question.where(document_id: self.id).map(:id)
    Answer.in(question_id: question_ids).map(:user_id).count > 0
  end
end
