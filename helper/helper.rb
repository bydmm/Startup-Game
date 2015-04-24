class Fixnum
  def thousand_separate
    self.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse
  end
end

class String
  def camelize
    self.split('_').collect(&:capitalize).join
  end
end