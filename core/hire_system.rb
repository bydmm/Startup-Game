class HireSystem
  attr_accessor :coders, :available_coders, :min_coders, :max_coders

  def initialize(game)
    @coders = []
    @game = game
    @available_coders = []
    @min_coders = 1
    @max_coders = 3
    @available_coders = HireSystem.load_coders
  end

  def self.staff
    puts 'Many thanks to: ' + load_coders.map(&:name).join(', ')
  end

  def self.estimate
    test_times = 1_000
    coders_rank = []
    load_coders.each do |coder|
      progress = 0
      salary = 0
      test_times.times do
        form = 10_000_000
        to = coder.work(form)
        progress += form - to
        salary += coder.salary
      end
      coder_rank =
        {
          avg_salary: salary / test_times,
          avg_progress: progress / test_times,
          coder: coder
        }
      coders_rank.push coder_rank
    end
    coders_rank =
      coders_rank.sort do |x, y|
        x = x[:avg_progress].to_f / x[:avg_salary].to_f
        y = y[:avg_progress].to_f / y[:avg_salary].to_f
        y <=> x
      end
    coders_rank.each do |coder_rank|
      useful = coder_rank[:avg_progress].to_f / coder_rank[:avg_salary].to_f
      puts "#{coder_rank[:coder].name}: #{coder_rank[:avg_progress]}(点/周) / #{(coder_rank[:avg_salary] / 4.0).round(2)}(元/周) = #{useful.round(4)}(点/元*周)"
    end
  end

  def start_hire
    hire
    puts ''
    puts "#{@coders.map(&:name).join(', ')}带着发家致富的梦想加入你的团队。"
    Keyboard.next
  end

  def hire?
    return unless could_hire?
    puts '你有空余的工位, 你需要招募员工么'
    Keyboard.conform do
      hire
    end
  end

  def fire?
    return unless could_fire?
    puts
    puts '你可以解雇让你不爽的员工'
    Keyboard.conform do
      fire
    end
  end

  private

  def hire
    return unless could_hire?
    puts "你可以最多可以雇佣#{max_coders}名员工，请谨慎选择:"
    available_coders.each do |coder|
      break unless could_hire?
      puts '-----'
      if coder.job != '产品汪'
        coder.job = '程序员'
      end
      puts "#{coder.job}: #{coder.name} 薪水: #{coder.salary.color_salary}"
      Keyboard.conform do
        @coders.push coder
        puts "#{coder.name}加入了你的团队。"
        puts
      end
    end
    if @coders.count < @min_coders
      puts Rainbow("你至少需要#{@min_coders}名员工加入你的团队!").red
      puts ''
      hire
      return
    end
  end

  def fire
    return unless could_fire?
    @coders.each do |coder|
      if coder.job != '产品汪'
        coder.job = '程序员'
      end
      puts "#{coder.job}: #{coder.name}"
      puts "程序员: #{coder.name}"
      Keyboard.conform do
        @coders.delete coder
        puts "#{coder.name}离开了你的团队。"
        puts
      end
    end
  end

  def could_hire?
    @coders.count < @max_coders
  end

  def could_fire?
    @coders.count > @min_coders
  end

  def self.load_coders
    coders = []
    Dir['./coders/*.rb'].each do |file|
      require file
      class_name = file.split('/').last.split('.').first.camelize
      coders.push Object.const_get(class_name).new
    end
    coders
  end

  def available_coders
    @available_coders - @coders
  end
end