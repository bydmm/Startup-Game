# 建议加入
# 道具 机械键盘，等
# 技能 半睡半醒大法，等
# 编码门派

class Fish < Coder
  def initialize
    @name = '游鱼彩虹'
    @salary = 8_000
  end

  def work(remain_difficulty)
    seed = rand 100
    case seed
    when 1..30 then
      puts "#{name}在屏幕前放了一根香烟，祭拜了代码之神，项目推进#{seed}"
    when 31..50 then
      puts "#{name}把壁纸换成了十字架，项目受到了神圣的指引推进#{seed}"
    when 51..99 then
      puts "#{name}用键盘敲了个佛像，屏幕大亮，项目受佛主保佑推进#{seed}"
    when 100 then
      puts "千年虫被#{name}消灭后，万年虫BOSS到来，所有电脑被占领"
      return remain_difficulty + rand(100)
    else
      puts "#{name}捡到了外星人留下的万能代码机器人，可以秒杀任何项目，于是转头开始为代码机器人编码"
      return remain_difficulty + rand(1000)
    end
    remain_difficulty - seed
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 准备攒钱买个代码机器人， 从此远离加班"
    company_money - salary
  end
end
