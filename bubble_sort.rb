# Bubble Sort:
#   A quadratic time sorting algorithm
#
#   Best Case Scenario: Sorted Data (Works in O(n) with better_bubble_sort)
#     -> Comparisons : n
#     -> Exchanges: 0
#   Average Case Scenario: Randomized Data
#     -> Comparisons: n(n-1) / 2
#     -> Exchanges: n(n-1) / 4
#   Worst Case : Reverse Sorted Data
#     -> Comparisons: n(n-1) / 2
#     -> Exchanges: n(n-1) / 2
class BubbleSort

  def initialize

    @data = [12, 13, 123, 4, 23, 56, 6, 8, 9, 0, 1]
    @sorted_data = [1, 2, 3, 4, 5, 6, 7]
  end

  # bubble_sort - bubble sort algorithm
  # Intuition: starting from the 0 sweep up until length - 1 index and swap any two adjacent elements which aren't sorted
  #            between the two. This sweep essentially brings up the max element. Decrement to length - 1 - 1 and repeat
  def bubble_sort

    n = @data.length - 1

    for i in (n).downto(1) do                     # Go from length - 1 to 1. Don't go to 0 because that will be an unnecessary sweep

      for j in 0..i-1 do                          # Go from 0 to i. We sweep through bringing up the biggest value left in the range

        if @data[j] > @data[j + 1]

          swap(@data, j, j + 1)
        end
      end
    end

    puts(@data)
  end

  # better_bubble_sort - version of bubble sort where the sort stops early if the data is sorted (Best case O(n))
  def better_bubble_sort

    n = @sorted_data.length - 1
    sorted = true                                 # Blindly assume we are given sorted data

    for i in (n).downto(1) do

      for j in 0..i-1 do

        if@sorted_data[j] > @sorted_data[j + 1]

          swap(@sorted_data, j, j + 1)            # We aren't given sorted data if we need to swap
          sorted = false
        end
      end

      if sorted                                   # Stop early if after one sweep no swaps were made

        puts("I stopped early!")
        puts(@sorted_data)
        break
      end
    end
  end

  # swap - swap helper method
  # @param arr - the Array which will have two items swapped
  # @param i1 - Index one of what needs to be swapped
  # @param i2 - Index two of what needs to be swapped
  def swap(arr, i1, i2)

    tmp = arr[i1]

    arr[i1] = arr[i2]
    arr[i2] = tmp
  end
end

# Driver
bs = BubbleSort.new
bs.bubble_sort
bs.better_bubble_sort