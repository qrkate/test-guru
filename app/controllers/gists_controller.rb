class GistsController < ApplicationController
  def create
    @passed_test = PassedTest.find(params[:id])
    result = GistQuestionService.new(current_user, @passed_test.current_question).call
    if result.respond_to? :html_url
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
