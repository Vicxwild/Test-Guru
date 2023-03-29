class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_one :category, through: :test

  before_save :before_save_set_next_question

  SUCCESS_RATE = 85.freeze

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def percentage_success
    ((correct_questions.to_f / test.questions.count) * 100).to_i
  end

  def success?
    percentage_success >= SUCCESS_RATE
  end

  def success!
    if self.success?
      self.success = true
    end

    save!
  end

  private

  def before_save_set_next_question
    self.current_question = current_question.present? ? next_question : test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
