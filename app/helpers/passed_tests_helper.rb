module PassedTestsHelper
  def current_timer(time)
    return if time.nil?

    timer = time.round
    timerMin = timer / 60
    timerSec = timer % 60
    "#{timerMin}:#{timerSec}"
  end
end
