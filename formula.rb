class D
  def name
    'D菊'
  end

  def salary
    3000
  end

  def work(remain_difficulty)
    forward = rand(1...100) / 1000.0
    puts "#{name}永不下班，项目进度前进#{(forward * 100).round(2)}%"
    remain_difficulty * (1.0 - forward)
  end
end

class SixSeconds
  def name
    '教主'
  end

  def salary
    15_000
  end

  def work(remain_difficulty)
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
end

class Stone
  def name
    '石头'
  end

  def salary
    30_000
  end

  def work(remain_difficulty)
    forward = rand(500...800)
    puts "#{name}巨巨轻描淡写，项目成功推进#{forward}"
    remain_difficulty - forward
  end
end

class StartupGame
  def initialize
    @week = 0
    @project_name = '嘀嘀打人'
    @estimate_project_difficulty = 10_000
    @money = 10_000_000
    @remain_difficulty = @estimate_project_difficulty
  end

  def coders
    [
      D.new,
      SixSeconds.new,
      Stone.new
    ]
  end

  def run
    while @remain_difficulty > 0
      @week += 1
      puts "第#{@week}周开始了，键盘的敲击声响起"
      puts "==============================="
      dally_work
      puts "第#{@week}周结束了，还剩下#{@remain_difficulty.round}点困难度等待开发"
      puts "==============================="
    end
    puts '开发完成'
  end

  def opening
    puts "#{coders.map(&:name).join(' ')}决定一起开发一款屌炸天的应用《#{@project_name}》，以此实现财务财务自由的目标"
    puts "经过一番估计,#{@project_name}的开发难度为#{@estimate_project_difficulty}点困难度，大家决定立马开工!"
    puts "==============================="
  end

  private

  def dally_work
    coders.each do |coder|
      @remain_difficulty = coder.work(@remain_difficulty)
    end
  end
end

game = StartupGame.new
game.opening
game.run