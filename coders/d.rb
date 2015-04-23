class D < Coder
  def initialize
    @name = 'D菊'
    @salary = 3000
  end

  def work(remain_difficulty)
    forward = rand(30...50) / 1000.0
    puts "#{name}永不下班，项目进度前进#{(forward * 100).round(2)}%"
    remain_difficulty * (1.0 - forward)
  end
end
