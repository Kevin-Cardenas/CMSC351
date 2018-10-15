# Insertion Sort:
#   Quadratic time sorting algorithm O(n^2)
#
#   Insertion Sort With Sentinel:
#     Worst Case Scenario : Reversed Order Data Set
#       -> Comparisons : [(n+2)(n-1)] / 2
#       -> Moves : [n^2 + 3n - 2] / 2
#     Average Case Scenario : Random Data Set
#       -> Comparisons : [n^2 + 3n - 4] / 4
#       -> Moves : ([n^2 + 3n - 4] / 4) + n
#     Best Case Scenario : Sorted Data Set
#       -> Comparisons : n - 1
#       -> Moves : 2n - 1
#
#   Insertion Sort WITHOUT Sentinel:
#     Worst Case Scenario : Reversed Order Data Set
#       -> Comparisons : [(n^2 + n - 2) / 2] - (n - 1)
#       -> Moves : [[n^2 + 3n - 2] / 2] - 1
#     Average Case Scenario : Random Data Set
#       -> Comparisons : [[n^2 + 3n - 4] / 4] - 1
#       -> Moves : ([n^2 + 3n - 4] / 4) - ln(n)
#     Best Case Scenario : Sorted Data Set
#       -> Comparisons : n - 1
#       -> Moves : 2n - 2

class InsertionSort

  def initialize

    @data = [1, 0, 2, 324, 30, 50, 10, 13, 1323, 90, 60]
  end

  # insertion_sort_sentinel - uses the sentinel being placed in A[0] to deal with sorting
  # Intuition: sorts the array one element at a time. Kind of like playing cards. You pick one card up and it is sorted.
  #           you then pick another card up and sort between those two. Repeat until the array is fully sorted
  def insertion_sort_sentinel

    sentinel = -(2**(0.size * 8 - 2))   # Creating the lowest value which will act as the sentinel
    @data.insert(0, sentinel)           # Put the sentinel in index 0
    n = @data.length - 1

    for i in 2..n                       # Start at 2 because you don't want to have an unnecessary loop iteration since A[1] is sorted

      temp = @data[i]                   # Save the temporary value of the element we are 'inserting'
      j = i - 1                         # Right most index of the part of the array that is already sorted

      while temp < @data[j]             # Going down the sorted half to see if we need to do any reordering within the ordered part

        @data[j + 1] = @data[j]
        j -= 1
      end

      @data[j + 1] = temp               # Insert the appropriate element in it's correct spot within the sorted part of the array
    end

    puts(@data)
  end

  # insertion_sort - normal insertion sort without a sentinel
  # Intuition: <same as above>
  def insertion_sort

    n = @data.length - 1

    for i in 2..n

      temp = @data[i]
      j = i - 1

      while j > 0 && @data[j] > temp  # Difference is here. With sentinel we never went to index 0. Here, we might so check

        @data[j + 1] = @data[j]
        j -= 1
      end

      @data[j + 1] = temp
    end

    puts(@data)
  end
end

# Driver
is = InsertionSort.new
is.insertion_sort_sentinel
is.insertion_sort