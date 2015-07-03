class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    (0...length).each do |idx1|
      (idx1 + 1 ... length).each do |idx2|
        result << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    result
  end

  def median
    middle_idx = length/2
    if count.odd?
      self.sort[middle_idx]
    else
      (self.sort[middle_idx] + self.sort[middle_idx - 1]) / 2.0
    end
  end

  def my_transpose
    result = Array.new(length){[]}
    self.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        result[col_idx] << el
      end
    end
    result
  end
end
