class Wolf < Coder
  def initialize
    @name = '小狼狼'
    @salary = 5_000
  end

  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(50...400)
      puts "#{name}灵机一动，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...6)
      fallback = bugs * rand(0...40)
      puts "#{name}脑洞大开，却引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 然后全买了吃的"
    company_money = company_money - salary
  end
end
