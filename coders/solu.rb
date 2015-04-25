class Solu < Coder
  def initialize
    @name = 'solu君'
    @salary = 1800 
  end

  def work(remain_difficulty)
    random = rand(10)
    if random >= 0 and random < 2
      forward = rand(1...20) 
      puts "#{name}五月病发作，工作懒散，项目推进#{forward}"
      remain_difficulty - forward
    elsif random >= 2 and random < 4
      puts "#{name}熬夜补番，上班打瞌睡没有产出！！(¦3[▓▓]"
      remain_difficulty
    elsif  random >= 4 and random < 7
      forward = rand(300...500)
      puts "#{name}中二病爆发大喊'The World'连续加班2天2夜，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      forward = rand(50...150)
      puts "#{name}颈椎病发作影响工作效率，项目缓慢推进#{forward}"
      remain_difficulty
    end
  end
  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水! 然而全部拿了去败手办！！"
    company_money - salary
  end
end