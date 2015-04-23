require './coder.rb'
Dir["./coders/*.rb"].each { |file| require file }

require './event.rb'
Dir["./events/*.rb"].each { |file| require file }

require './company.rb'
Dir["./companies/*.rb"].each { |file| require file }

require './project.rb'
Dir["./projects/*.rb"].each { |file| require file }

class StartupGame
  attr_accessor :week

  def initialize
    @week = 0
    @company = Fivecent.new
    @project = UberBeating.new
  end

  def coders
    @coders ||=
      [
        D.new,
        SixSeconds.new,
        Stone.new,
        GrandPaFour.new
      ]
  end

  def events
    @events ||=
      [
        KillPM.new
      ]
  end

  def run
    while @project.remain_difficulty > 0 && @company.money > 0
      self.week += 1
      old_remain_difficulty = @project.remain_difficulty
      puts "第#{@week}周开始了，键盘的敲击声响起"
      one_week
      forword = (old_remain_difficulty - @project.remain_difficulty).round
      puts "第#{@week}周结束了，成功完成了#{forword}点困难度， 还剩下#{@project.remain_difficulty.round}点困难度等待开发"
      puts ""
    end
    if @company.money > 0
      puts '项目上线，等待他们的是...'
    else
      puts '资金耗尽，项目失败...'
    end
  end

  def opening
    puts "#{coders.map(&:name).join(',')}决定一起开发一款屌炸天的应用《#{@project.name}》，以此实现财务财务自由的目标。"
    puts "经过一番估计,#{@project.name}的最小可行版本的开发难度为#{@project.estimate_project_difficulty}点困难度"
    puts "他们成立了#{@company.name}, 和投资人忽悠了一阵PPT后拿到了#{@company.angel_fund}元天使资金, 大家决定立马开工!"
    puts ""
  end

  private

  def one_week
    random_events
    weekly_work
    pay_salary if salary_day?
  end

  def random_events
    events.each do |event|
      @project.remain_difficulty = event.happen(@project.remain_difficulty)
    end
  end

  def weekly_work
    coders.each do |coder|
      @project.remain_difficulty = coder.work(@project.remain_difficulty)
      if @project.remain_difficulty < 0
        @project.remain_difficulty = 0
        break
      end
    end
  end

  def salary_day?
    week % 4 == 0
  end

  def pay_salary
    puts "==================发薪水咯=========================="
    old_money = @company.money
    coders.each do |coder|
      @company.money = coder.pay(@company.money)
    end
    puts "共计发出工资：#{old_money - @company.money}，#{@company.name}剩余资金#{@company.money}"
    puts "==================================================="
  end
end

game = StartupGame.new
game.opening
game.run