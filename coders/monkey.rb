class Monkey < Coder
  def initialize
    @name = '堕落的猴子'
    @salary = 8_000
  end

  def work(remain_difficulty)
    workflow = rand 100
    case workflow
    when 0..20
      forward = rand(1..5)
      puts "#{name}边刷NGA边写代码, 项目推进#{forward}"
      remain_difficulty + forward
    when 21..80
      forward = rand(200...500)
      puts "#{name}努力奋斗，发扬不作死就不会死的精神，成功将项目推进#{forward}"
      remain_difficulty - forward
    when 81..100
      puts "#{name}被催更的声音淹没, 疯狂扫漫中, 连续一周没有产出"
      remain_difficulty
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 几天后#{name}收到了几百本漫画"
    company_money - salary
  end

  def salary
    Money.add_rate("USD", "CNY", 6.1969)
    Money.us_dollar(@salary * 100).exchange_to("CNY").to_f
  end
end
