require 'rspec'
require 'array_extensions'

describe "Array#my_uniq" do
  subject(:test_array) { [1,2,1,3,3] }
  it "should return unique elements in the order they appeared" do
    expect(test_array.my_uniq).to eq([1,2,3])
  end
end

describe "Array#two_sum" do
  subject(:test_array) { [-1, 0, 2, -1, 1] }

  it "should return index pairs where elements sum to zero" do
    expect(test_array.two_sum).to eq([[0 ,4], [3, 4]])
  end

  subject(:test_array2) { [0, 0, 0] }
  it "should return the pairs in order" do
    expect(test_array2.two_sum).to eq([[0, 1], [0, 2], [1, 2]])
  end
end

describe "Array#median" do
  subject(:odd_array) {[2, 3, 1]}
  subject(:even_array) {[3, 3, 4, 5]}

  it "should return middle of sorted odd num array" do
    expect(odd_array.median).to eq(2)
  end

  it "should retrn average of middle two els in even num array" do
    expect(even_array.median).to eq(3.5)
  end
end

describe 'Array#my_transpose' do
  subject(:test_matrix) {[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
]}

  it "should return transposed array" do
    expect(test_matrix.my_transpose).to eq([[0, 3, 6],
                                           [1, 4, 7],
                                           [2, 5, 8]])
  end

  it "shouldn't call built in Array#transpose" do
    expect(test_matrix.my_transpose).not_to receive(:transpose)
  end
end
