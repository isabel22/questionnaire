class Answer
  include Mongoid::Document
  field :body, type: String

  belongs_to :question
  belongs_to :user
end
