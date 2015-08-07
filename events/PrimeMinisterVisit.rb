class PrimeMinisterVisit < Event
  def initialize
    @has_Visited = false # At this time Li K*Q* was not in ZhongGuanCun.
    @probability = 0.1
  end

  def happen(remain_difficulty)
    return remain_difficulty if noVisit
    return remain_difficulty if happen?
    puts '总理访问中关村，喝了一口互联网泡沫'
    doVisit
    remain_difficulty * 0.8
  end

  private

  def doVisit
    @has_Visited = true # At this Li had been to ZhongGuanCun
  end

  def noVisit
    @has_Visited == false
  end
end
