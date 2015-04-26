class Fixnum
  def thousand_separate
    self.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse
  end

  def color_users
    colored_users =
      if self > 1_000
        Rainbow(self.thousand_separate).color('#cd853f')
      elsif self >= 1_000
        Rainbow(self.thousand_separate).yellow
      elsif self < 1000 && self > 0
        Rainbow(self.thousand_separate).green
      elsif self <= 0
        self
      end
    "#{colored_users}人"
  end

  def color_salary
    colored_salary =
      if self > 15_000
        Rainbow(self.thousand_separate).color('#cd853f')
      elsif self >= 10_000
        Rainbow(self.thousand_separate).yellow
      elsif self < 10_000 && self > 0
        Rainbow(self.thousand_separate).green
      elsif self <= 0
        self
      end
    "#{colored_salary}元"
  end

  def color_fund
    colored_fund =
      if self > 1_000_000
        Rainbow(self.thousand_separate).green
      elsif self > 100_000
        Rainbow(self.thousand_separate).blue.bright
      elsif self > 10_000
        Rainbow(self.thousand_separate).yellow
      elsif self < 10_000 && self > 0
        Rainbow(self.thousand_separate).red
      elsif self <= 0
        Rainbow(self).red
      end
    "#{colored_fund}元"
  end
end

class String
  def camelize
    self.split('_').collect(&:capitalize).join
  end
end

class Keyboard
  def self.next
    STDIN.gets
  end

  def self.conform
    puts '按Y确认, 按其他键跳过'
    user_input = STDIN.gets.delete!("\n")
    yield if user_input.downcase == 'y'
  end
end
