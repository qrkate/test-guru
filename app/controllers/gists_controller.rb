class GistsController < ApplicationController
  def create
    @passed_test = PassedTest.find(params[:id])
    result = Github::CreateGist.call(current_user, @passed_test.current_question)
    if result.success?
      flash[:notice] = t('.success', link_gist: link_gist(result))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @passed_test
  end

  private
  def link_gist(result)
    view_context.link_to('Gist', result.html_url, target: '_blank')
  end
end
