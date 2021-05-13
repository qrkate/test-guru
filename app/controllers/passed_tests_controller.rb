class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_passed_test, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])
    if @passed_test.completed?
      TestsMailer.completed_test(@passed_test).deliver_now
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@passed_test.current_question).call
    flash_options = if result.success?
      { notice: t('.success') }
    else
      { alert: t('.failure') }
    end
    redirect_to @passed_test, flash_options
  end

  private
  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end
end
