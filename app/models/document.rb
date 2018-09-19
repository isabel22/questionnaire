class Document
  include Mongoid::Document
  field :title, type: String

  has_many :questions
end
