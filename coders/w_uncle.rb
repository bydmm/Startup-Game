class WUncle < Coder
  def initialize
    @name = 'w叔'
    @salary = 1500
  end

  def work(remain_difficulty)
    forward = rand(5...10)
    puts randdom_events(forward)
    remain_difficulty - forward
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 并表示会继续奋斗"
    company_money - salary
  end

  def randdom_events(forward)
    events = [
        "由于机房爆炸,#{name}被所有大佬抓出来艹翻了，导致项目进度下降#{forward}",
        "由于#{name}被四爷抓去打玩家,业务故障无人处理,导致项目进度下降#{forward}",
        "由于#{name}带忠贤出去逛街,重大更新无法升级，导致项目进度下降#{forward}",
        "由于#{name}花样作大死,不小心用root玩坏了MySQL数据库,导致项目进度下降#{forward}"
    ]
    events_len = events.length
    events[rand(events_len)]
  end
end
