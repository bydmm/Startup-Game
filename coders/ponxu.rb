class Ponxu < Coder
  def initialize
    @name = '胖徐'
    @salary = 15_000
  end

  def work(remain_difficulty)
    out = 0
    case rand 120
    when 1..30 then
      out = -rand(100)
      puts "#{name}的QQ窗口被抖动了一下, 内容:服务器全线宕机#{out}"
    when 31..50 then
      out = -rand(100)
      puts "#{name}正在使劲晃动鼠标!!!Ubuntu又卡死了!!!#{out}"
    when 51..99 then
      out = rand(100)
      puts "#{name}潇洒回车, 心里默叨:这个Bug搞定#{out}"
    when 100..110 then
      out = rand(100)
      puts "#{name}正在厕所看码农新闻...啥? 苹果又出新语言了?#{out}"
    else
      out = rand(1000)
      puts "#{name}正在考虑要不要去卖煎饼#{out}"
    end
    return remain_difficulty - out
  end

  def pay(company_money)
    puts "#{name}差点领取了#{salary}元薪水, 擦, 公司又拖欠了"
    company_money - salary
  end
end
