class Feedback
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :subject, :body

  validates :subject, :body, presence: true

  def initialize(attributes = {})
    @subject = attributes[:subject]
    @body = attributes[:body]
  end

  def persisted?
    false
  end
end
