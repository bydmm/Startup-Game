class KillPM < Event
  def initialize
    @has_pm = true # At this time the PM is alive.
    @probability = 0.1
  end

  def happen(remain_difficulty)
    return remain_difficulty if no_pm
    return remain_difficulty if happen?
    puts '程序员们忍无可忍，砍死了产品经理，项目难度减小10%'
    kill_pm
    remain_difficulty * 0.9
  end

  private

  def kill_pm
    @has_pm = false # At this time the PM is dead.
  end

  def no_pm
    @has_pm == false # There is no pm anymore.
  end
end