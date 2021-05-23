class PassedTestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_passed_test, only: %i[show result update]

  def show; end

  def result; end

  def update
    @passed_test.accept!(params[:answer_ids])
    if @passed_test.completed?
      @passed_test.update!(success: true) if @passed_test.successful_result?
      reward
      redirect_to result_passed_test_path(@passed_test)
    else
      render :show
    end
  end

  private
  def find_passed_test
    @passed_test = PassedTest.find(params[:id])
  end

  def reward
    badges = BadgeService.new(@passed_test).call
    unless badges.empty?
      current_user.badges.push(badges)
      flash[:notice] = t('push_badge')
    end
  end
end
