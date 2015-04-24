class GrandPaFour < Coder
  def initialize
    @name = '四爷'
    @salary = 15_000
    @killed = 0
  end

  def work(remain_difficulty)
    if rand(10) > 4
      killed = rand(1...4)
      @killed += killed
      forward = killed * rand(150...200)
      puts "#{name}随手打死了#{killed}个玩家，项目成功推进#{forward}"
      remain_difficulty - forward
    elsif rand(10) > 8 && @killed > 1
      fallback = @killed * rand(10...20)
      puts "#{name}因为背了#{@killed}条人命，警察叔叔追捕中，所有人被叫去问话，项目进度倒退#{fallback}"
      remain_difficulty - fallback
    else
      forward = rand(1...200)
      puts "#{name}制止了草狗侠玩舰娘，项目成功推进#{forward}"
      remain_difficulty - forward
    end
  end
end