class StartupGame
  attr_accessor :week

  def initialize
    @week = 0
    @company = Fivecent.new
    @project = UberBeating.new
    @hire_sys = HireSystem.new(self)
  end

  def opening
    puts '你决定一起开发一款屌炸天的应用' + @project.name + '以此实现财务财务自由的目标。'
    puts "你成立了#{@company.name}, 你拿出了你毕生的积蓄#{@company.color_angel_fund}作为启动资金。"
    puts '点子和钱都有了，就差几个程序员了'
    Keyboard.next
  end

  def hire_coders
    @hire_sys.start_hire
  end

  def run
    puts "经过一番估计, 大家认为#{@project.name}的开发难度为#{@project.estimate_project_difficulty}点困难度, 这可是个不小的工程，要加油干了。"
    puts
    while @project.remain_difficulty > 0 && @company.money > 0
      one_week
      Keyboard.next
    end
    if @company.money > 0
      puts '项目上线，等待他们的是...'
    else
      puts '资金耗尽，项目失败...'
    end
  end

  private

  def coders
    @hire_sys.coders
  end

  def events
    @events ||=
      [
        KillPM.new
      ]
  end

  def one_week
    self.week += 1
    old_remain_difficulty = @project.remain_difficulty
    puts "第#{@week}周开始了，键盘的敲击声响起"

    random_events
    weekly_work

    @hire_sys.fire?
    @hire_sys.hire?

    pay_salary if salary_day?
    forword = (old_remain_difficulty - @project.remain_difficulty).round
    puts "第#{@week}周结束了，成功完成了#{forword}点困难度， 还剩下#{@project.remain_difficulty.round}点困难度等待开发"
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
    puts '==================发薪水咯=========================='
    old_money = @company.money
    coders.each do |coder|
      @company.money = coder.pay(@company.money)
    end
    cost = old_money - @company.money
    puts "共计发出工资：#{cost}，#{@company.name}剩余资金#{@company.color_money}"
    puts '===================================================='
  end
end