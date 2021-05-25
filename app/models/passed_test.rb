class PassedTest < ApplicationRecord
  SUCCESSFUL_RESULT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def result_precent
    (correct_questions.to_f / test.questions.count) * 100
  end

  def successful_result?
    result_precent >= SUCCESSFUL_RESULT
  end

  def left_time
    return if test.timer.nil?
    time = set_timer - Time.current
    return 0 if time <= 0
    time
  end

  def time_is_over?
    left_time == 0
  end

  private
  def set_timer
    created_at + test.timer.minute
  end

  def before_validation_set_current_question
    return unless test.present?
    self.current_question =
      if current_question.nil?
        test.questions.first
      else
        test.questions.order(:id).where('id > ?', current_question.id).first
      end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.corrects
  end
end
