class GistsController < ApplicationController
  def create
    @passed_test = PassedTest.find(params[:id])
    result = Github::CreateGist.call(user: current_user, question: @passed_test.current_question)
    flash = result.success? ? { notice: t('.success', link_gist: link_gist(result)) } : {alert: t('.failure')}
    redirect_to @passed_test, flash
  end

  private
  def link_gist(result)
    view_context.link_to(t(".gist_url"), result.html_url, target: '_blank')
  end
end
