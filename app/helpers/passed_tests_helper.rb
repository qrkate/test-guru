module PassedTestsHelper
  def current_timer(time)
    return if time.nil?

    timer = time.round
    min = timer / 60
    sec = timer % 60
    "#{min}:#{sec}"
  end
end
