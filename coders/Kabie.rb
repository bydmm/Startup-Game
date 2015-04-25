class Kabie < Coder
  def initialize
    @name = 'Kabie'
    @salary = 8_888

    @week = 0
    @bitcoins = 0
  end

  def work(remain_difficulty)
    @week += 1
    case rand(10)
    when 0
      puts "#{name}删除了大量代码，项目居然还能正常运行"
      remain_difficulty
    when 1
      fixed_bugs = rand(1..5)
      new_bugs = rand(1..5)
      puts "#{name}更新了系统内核和库依赖，#{fixed_bugs}个BUG因此消失，但又引入了#{new_bugs}个新BUG"
      remain_difficulty - fixed_bugs + new_bugs
    when 2
      n = rand(2..7)
      puts "#{name}进行了#{n}次重构之后，终于还是 reset 到了上一个版本"
      remain_difficulty
    when 3..9
      bitcoins_gain = rand
      @bitcoins += bitcoins_gain
      puts "#{name}用服务器挖比特币，项目好像没什么进展"
      remain_difficulty
    end
  end

  def pay(company_money)
    if company_money < 50000
      donation = (@bitcoins * 6666).to_i
      puts "公司财政危机，#{name}捐出了挖到的#{@bitcoins}个比特币，价值#{donation}"
      @bitcoins = 0
      company_money + donation
    else
      puts "#{name}领取了#{salary}元薪水"
      company_money - salary
    end
  end

end
