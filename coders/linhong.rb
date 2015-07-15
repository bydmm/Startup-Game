class Linhong < Coder
  def initialize
    @name = '林Hong'
    @salary = 6000
  end

  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(100...400)
      puts "#{name}和女神打了一晚上魔兽，精力百倍，把项目推进了#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...4)
      fallback = bugs * rand(0...40)
      puts "#{name}泳装还没洗浑身痒痒的，引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    bonus = salary*0.1*rand(5...20)
    puts "#{name}领取了#{salary}元薪水,因为长得太帅公司多发了#{bonus}元奖金"
    company_money = company_money - salary - bonus
  end
end
