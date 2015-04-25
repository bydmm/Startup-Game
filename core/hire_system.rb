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

  def start_hire
    hire
    puts ''
    puts "#{@coders.map(&:name).join(', ')}带着创富的梦想加入你。"
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
    puts "你可以最多可以雇佣#{max_coders}名程序员，请谨慎选择:"
    available_coders.each do |coder|
      break unless could_hire?
      puts '-----'
      puts "程序员: #{coder.name} 薪水: #{coder.salary.color_salary}"
      Keyboard.conform do
        @coders.push coder
        puts "#{coder.name}加入了你的团队。"
        puts
      end
    end
    if @coders.count < @min_coders
      puts Rainbow("你至少需要#{@min_coders}名程序员加入你的团队!").red
      puts ''
      hire
      return
    end
  end

  def fire
    return unless could_fire?
    @coders.each do |coder|
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