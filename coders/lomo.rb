class lomo < Coder
  def initialize
    @name = '老猫'
    @salary = 4000
  end

  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(100...400)
      puts "#{name}被身边刚来的女神激励，奋笔疾书，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...4)
      fallback = bugs * rand(0...40)
      puts "#{name}着急改变世界，却不料引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 怀着忐忑的心情约女神吃个了饭"
    company_money = company_money - salary
  end
end