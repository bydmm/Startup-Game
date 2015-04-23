require './coder.rb'
Dir["./coders/*.rb"].each { |file| require file }

require './event.rb'
Dir["./events/*.rb"].each { |file| require file }

class StartupGame
  def initialize
    @week = 0
    @project_name = '嘀嘀打人'
    @estimate_project_difficulty = 10_000
    @money = 10_000_000
    @remain_difficulty = @estimate_project_difficulty
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
    while @remain_difficulty > 0
      @week += 1
      old_remain_difficulty = @remain_difficulty
      puts "第#{@week}周开始了，键盘的敲击声响起"
      puts "==============================="
      random_events
      weekly_work
      forword = (old_remain_difficulty - @remain_difficulty).round
      puts "第#{@week}周结束了，成功完成了#{forword}点困难度， 还剩下#{@remain_difficulty.round}点困难度等待开发"
      puts "==============================="
    end
    puts '项目上线，等待他们的是...'
  end

  def opening
    puts "#{coders.map(&:name).join(' ')}决定一起开发一款屌炸天的应用《#{@project_name}》，以此实现财务财务自由的目标"
    puts "经过一番估计,#{@project_name}的MVP的开发难度为#{@estimate_project_difficulty}点困难度，大家决定立马开工!"
    puts "==============================="
  end

  private

  def random_events
    events.each do |event|
      @remain_difficult = event.happen(@remain_difficulty)
    end
  end

  def weekly_work
    coders.each do |coder|
      @remain_difficulty = coder.work(@remain_difficulty)
      if @remain_difficulty < 0
        @remain_difficulty = 0
        break
      end
    end
  end
end

game = StartupGame.new
game.opening
game.run