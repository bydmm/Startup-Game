=begin
  Author: Gstar
  CreatedAt: 2015-04-25
  Description: Make a coder for this game.
=end

class Gstar < Coder
  def initialize
    @name = 'Gstar'
    @salary = 2345
  end

  def work(remain_difficulty)
    #This coder will make program forward with 75 percents.
    if rand(12) > 3
      forward = rand(120...240)
      puts "#{name}什么都没有做，然而项目却推进#{forward}"
      remain_difficulty - forward
    #The other 25% will make program fallback.
    else
      bugs = rand(3...12)
      fallback = bugs * rand(36...120)
      puts "#{name}忘记吃药，制造了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    #get salary.
    puts "#{name}领取了#{salary}元薪水, 并不知道钱花在哪里，反正就是说没有了。"
    company_money = company_money - salary
  end
end
