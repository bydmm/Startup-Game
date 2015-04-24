class Fixnum
  def thousand_separate
    self.to_s.reverse.gsub(/...(?=.)/, '\&,').reverse
  end
end