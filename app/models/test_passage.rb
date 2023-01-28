class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

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

  private

  def before_save_set_next_question
    self.current_question = current_question.present? ? next_question : test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
