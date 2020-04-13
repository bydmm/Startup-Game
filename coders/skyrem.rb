class Skyrem < Coder
  def initialize
    @name = '张胡来'
    @salary = 888
  end

  def work(remain_difficulty)
    status = rand(10)
    if status < 3
      forward = rand(salary)
      puts "#{name}工作得马马虎虎,项目推进#{forward}"
      remain_difficulty - forward
    elsif status > 3 and status < 8
      bugs = rand(5...10)
      fallback = bugs * rand(salary) * 0.5
      puts "#{name}无心工作，整天刷知乎，复制粘贴导致#{bugs}个BUG，项目倒退#{fallback}"
      remain_difficulty + fallback
    else
      forward = rand(salary)* 0.4
      puts "#{name}非常不爽，来到你面前一拍桌子：‘我要涨工资！不然就解雇我吧！’"
      remain_difficulty - forward
    end
  end

  def pay(company_money)
    put "#{name}获得了#{salary}元报酬"
  end

end
