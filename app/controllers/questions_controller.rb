class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: "<%@test.questions.each do |question|%> <%= question.body%> <br> <%end%>"
  end

  def show
    render inline: "<%= @question.body%>"
  end

  def new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render inline: "Вопрос '<%= @question.body%>' сохранен в тест '<%= @test.title%>'."
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    render inline: "Вопрос '<%= @question.body%>' удален."
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найден!"
  end
end
