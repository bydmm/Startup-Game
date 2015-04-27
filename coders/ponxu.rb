class Ponxu < Coder
  def initialize
    @name = '胖徐'
    @salary = 15_000
  end

  def work(remain_difficulty)
    seed = rand 100
    case seed
    when 1..30 then
      puts "#{name}的QQ窗口被抖动了一下, 内容:服务器全线宕机#{seed}"
    when 31..50 then
      puts "#{name}正在使劲晃动鼠标!!!Ubuntu又卡死了!!!#{seed}"
    when 51..99 then
      puts "#{name}潇洒回车, 心里默叨:这个Bug搞定#{seed}"
    when 100 then
      puts "#{name}正在测试看码农新闻...啥? 苹果又出新语言了?"
      return remain_difficulty + rand(100)
    else
      puts "#{name}正在考虑要不要去卖煎饼"
      return remain_difficulty + rand(1000)
    end
    remain_difficulty - seed
  end

  def pay(company_money)
    puts "#{name}差点领取了#{salary}元薪水, 擦, 公司又拖欠了"
    company_money - salary
  end
end
