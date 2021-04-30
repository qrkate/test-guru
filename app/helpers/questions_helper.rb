module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создать новый вопрос к #{question.test.title}"
    else
      "Редактировать вопрос к #{question.test.title}"
    end
  end
end
