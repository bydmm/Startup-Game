class StartupGame
  attr_accessor :week

  def initialize
    @week = 0
    @company = Fivecent.new
    @project = UberBeating.new
    @hire_sys = HireSystem.new(self)
  end

  def opening
    puts Rainbow('『2015又是一幅好光景啊』').yellow+'，加班结束之后的你看了看四周，已是深夜。'
    puts '你握紧了拳头，心想'+Rainbow('『我不能再这么加班下去了，我要改变世界』').yellow+'，灌木丛里的野狗叫了一声，以示鼓励。'
    puts '你决定一起开发一款屌炸天的应用，叫做：'
    @project.name = STDIN.gets.chomp
    puts '你决定给公司起名为：'
    @company.name = STDIN.gets.chomp
    puts "你成立了"+@company.name+", 你拿出了你毕生的积蓄#{@company.color_angel_fund}作为#{@project.name}的启动资金。"
    puts '点子和钱都有了，就差几个员工了'
    Keyboard.next
  end

  def hire_coders
    @hire_sys.start_hire
  end

  def run
    mvp
  end

  private

  def mvp
    puts "经过一番估计, 大家认为#{@project.name}的开发难度为#{@project.estimate_project_difficulty}点困难度, 这可是个不小的工程，要加油干了。"
    puts
    while @project.remain_difficulty > 0 && @company.money > 0
      work_one_week
      Keyboard.next
    end
    if @company.money > 0
      puts "#{@project.name}的第一版终于撸出来啦，他已经具备基本功能"
      beta
    else
      puts '资金耗尽，项目失败...'
    end
  end

  def beta
    @project.beta_init
    @company.money += 500_000
    @online_week = 0
    beta_info
    while @project.remain_difficulty > 0 && @company.money > 0 && @project.users <= 1_000_000
      work_one_week
      user_growth
      Keyboard.next
    end
    if @project.remain_difficulty <= 0
      puts "#{@project.explode_point[:name]}终于撸出来啦, 用户疯狂的涌进服务器"
      @project.users *= 100
      @project.users = 1_000_000 if @project.users <= 1_000_000
      puts "用户数量爆炸到#{@project.color_users}, Disk is panic!"
    end
    if @project.users >= 1_000_000
      puts "投资人很满意，决定追加投资，红杉基金也闻风而动.."
    end
    if @company.money <= 0
      puts '资金耗尽，项目失败...'
    end
  end

  def beta_info
    puts "大家七手八脚的把代码架设到了云服务器上, 然后呼朋唤友用户量瞬间增长到#{@project.color_users}"
    puts '同时，大家都明白，项目必须有一个爆点才能吸引到大量用户。'
    puts '在前期开发的过程中，大家就注意到一个可能的爆点，那就是:'
    Keyboard.next
    puts Rainbow(@project.explode_point[:name]).red.underline
    puts Rainbow(@project.explode_point[:description]).blue.bright
    Keyboard.next
    puts '一名投资人察觉到了你们的项目，听取了爆点的汇报后非常满意, ' \
         "决定投资#{Rainbow('500,000').red}元, \n" \
         '并表示如果用户量增长到1,000,000人, 就领投A轮'
    Keyboard.next
  end

  def coders
    @hire_sys.coders
  end

  def events
    @events ||=
      [
        KillPM.new
      ]
  end

  def work_one_week
    self.week += 1
    old_remain_difficulty = @project.remain_difficulty
    puts "第#{@week}周开始了，键盘的敲击声响起"

    random_events
    weekly_work

    @hire_sys.fire?
    @hire_sys.hire?

    pay_salary if salary_day?
    forword = (old_remain_difficulty - @project.remain_difficulty).round
    puts "第"+Rainbow(week).red+"周结束了，成功完成了"+Rainbow(forword).red+"点困难度， 还剩下#{@project.remain_difficulty.round}点困难度等待开发"

  end

  def user_growth
    @online_week += 1
    growth = @project.user_growth(@online_week).round
    @project.users += growth
    puts "注册用户增长了#{growth.color_users}, 大家倍受鼓舞"
    puts "注册用户累计达到了#{@project.color_users}"
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