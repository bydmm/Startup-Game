class Rudy < Coder
  def initialize
    @name = '弗丽莎'
    @salary = 10_000
  end

  def work(remain_difficulty)
    workflow = rand 100
    case workflow
    when 1..20
      fallback = rand(1..5)
      puts "#{name}早上正急急忙忙的跑步赶去打卡,结果迟到#{workflow}分钟,项目难度增加#{fallback}"
      remain_difficulty + fallback
    when 21..60
      forward = rand(100...500)
      puts "#{name}努力奋斗，发扬不作死就不会死的精神，成功将项目推进#{forward}"
      remain_difficulty - forward
    when 81..90
      bugs = rand(1..5)
      fallback = bugs * rand(0..50)
      puts "#{name}思考了下人生，引入#{bugs}个BUG。项目难度增加#{fallback}"
      remain_difficulty + fallback
    when 91..100
      num = rand(100..1000)
      puts "#{name}深夜还没回家，心中画了#{num}个圈圈"
      remain_difficulty 
    end
  end

  def pay(company_money)
    puts "#{name}几乎领取了#{salary}元薪水, 然而因为迟到扣光了"
    company_money
  end

end
