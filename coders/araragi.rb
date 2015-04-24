class araragi < Coder
  def initialize
    @name = '阿垃垃圾君'
    @salary = 3000
  end

  def work(remain_difficulty)
    if rand(10) > 4
      imoto = rand(1...3)
      forward = imoto * rand(10...200)
      puts "#{name}的#{imoto}妹妹前来当程序员鼓励师,大家干劲十足,项目推进了#{forward}"
      remain_difficulty - forward
    else
      forward = rand(1...1)
      puts "#{name}被女朋友发现在偷看别人小裤裤,连续一周没有产出,项目推进#{forward}"
      remain_difficulty - forward
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 立马给暴雪爸爸充值,让爸爸再爱我一次。"
    company_money = company_money - salary
  end

end