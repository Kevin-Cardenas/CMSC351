# SelectionSort:
#   A quadratic time sorting algorithm. No matter what, this algorithm runs the same every single time
#
#   Worst Case Scenario : ---
#     -> Comparisons : (n(n- 1)) / n
#     -> Moves : n - 1
#   Average Case Scenario : ---
#      -> Comparisons : (n(n- 1)) / n
#      -> Moves : n - 1
#   Best Case Scenario : ---
#      -> Comparisons : (n(n- 1)) / n
#      -> Moves : n - 1
class SelectionSort

  def initialize
    @data = [1, 0, 2, 324, 30, 50, 10, 13, 1323, 90, 60]
  end

  # selection_sort - sorts the data set by partitioning the array, in-place, into a sorted part and unsorted part
  # Intuition: sorts the array by going through the array and setting an index which acts like a 'wall' between the sorted
  #           and unsorted parts of the array. We go through the array grab the largest element and bring it up to the top.
  #           After the first iteration, the array is sorted at the last index and everything else before is unsorted. Repeat.
  #           After words, however, n and n-1 are sorted. Repeat until the whole array is sorted.
  def selection_sort

    n = @data.length - 1

    for i in (n).downto(1)            # Start from the end of the array

      k = i                           # k is the biggest element we have seen so far from the remaining unsorted data
      for j in 0..i                   # Traverse up to, but not including the sorted part of the array

        if @data[j] > @data[k]

          k = j                       # This sets the new max if we ever saw one
        end

        swap(@data, i, k)             # Regardless if k is ever changed, you still swap (Potentially i equals k)
      end
    end

    puts(@data)
  end

  # swap - helper swap function
  # @param arr - data set array
  # @param i1 - index which will be swapped
  # @param i2 - index which will be swapped
  def swap(arr, i1, i2)

    tmp = arr[i1]

    arr[i1] = arr[i2]
    arr[i2] = tmp
  end
end

# Driver
ss = SelectionSort.new
ss.selection_sort