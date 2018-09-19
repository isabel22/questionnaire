class Question
  include Mongoid::Document
  field :body, type: String

  belongs_to :document
end
