class Ltype < Coder
  def initialize
    @name = 'ltype'
    @salary = 1800
  end

  def work(remain_difficulty)
    if rand(100) > 90
      forback = rand(50...300)
      puts "#{name}失手将代码托管服务器的项目源码删除，项目倒退#{forback}"
      remain_difficulty + forback
    else
      forward = rand(10..200)
      time = rand(6..24)
      puts "#{name}本周加班了#{time}个小时，项目推进了#{forward}"
      remain_difficulty - forward
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 购买了一个saber手办并放于办公桌上，第二天发现被扫地阿姨丢了"
    company_money = company_money - salary
  end
end
