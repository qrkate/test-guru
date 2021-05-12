class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    mail to: @user.email, subject: "Вы только что завершили TestGuru тест!"
  end
end
