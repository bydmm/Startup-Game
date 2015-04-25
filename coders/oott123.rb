class Oott123 < Coder

  def initialize
    @type = types.sample
    @week = 0
    @month = 0
  end

  def name
    Rainbow("#{@type[:prefix]}的三三").color(@type[:color])
  end

  def salary(month = @month)
    (@type[:salary] * (1 + @type[:inc] * (month / 4))).to_int
  end

  def types
    [
      { :prefix => "勤劳能干", :color => :blue,
        :ability => 3, :salary => 12167, :inc => 0.3 },
      { :prefix => "物美价廉", :color => :yellow,
        :ability => 5, :salary => 3333, :inc => 0.2 },
      { :prefix => "好吃懒做", :color => :red,
        :ability => 1, :salary => 2333, :inc => 0.5 },
      { :prefix => "即将超神", :color => :green,
        :ability => 20, :salary => 10000, :inc => 0.4 },
      { :prefix => "资历平平", :color => :red,
        :ability => 7, :salary => 5233, :inc => 0.1 }
    ]
  end

  def use_money(name, salary)
    u = [
      "#{name}开心领取了#{salary}元薪水，思考了一下最后存进了银行",
      "#{name}默默地领取了#{salary}元薪水，然后捐给了 Wikipeida",
      "#{name}拿走了#{salary}元薪水，边数钱边吐槽老板真抠门"
    ]
    p @month % 4
    if @month % 4 < 3
      # 还没打算涨薪
      u.concat([
        "#{name}一边数着#{salary}元钞票，计算着加薪的日子",
        "#{name}默默地领了#{salary}元薪水，暗暗吐槽到到底啥时候加薪啊",
        "#{name}领了#{salary}元薪水，感叹这人生真艰难"
        ])
    end
    if @month % 4 < 3
      # 不涨薪
      "#{u.sample}。"
    else
      "#{u.sample}，并提出加薪请求：如果下个月工资不涨到#{salary(@month+1)}，就请#{Rainbow("立刻解雇他").red}。"
    end
  end

  def work(remain_difficulty)
    @week = @week + 1
    if rand(10) > 3
      forward = rand(100...500)
      puts "#{name}奋笔疾书，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...50)
      puts "#{name}奋笔疾书，却引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    puts use_money(name, salary)
    remain = company_money - salary
    @month = @month + 1
    remain
  end
end