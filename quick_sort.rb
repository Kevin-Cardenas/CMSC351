# QuickSort - A sorting algorithm belonging to the O(nlgn) family because it is a divide and conquer algorithm
# Intuition - you have a pivot which is an index randomly selected from the array. You have a wall and curr_idx which
#          start at index[0] for the first iteration. You compare your pivot to the curr_idx and if the curr_idx >= pivot
#          then you switch the curr_idx with the element residing at the [wall + 1]. Everything going to the right of the wall
#          is greater than the pivot and everything to the left of the wall is less than the pivot. Once the curr_idx hits the
#          pivot value you switch it with the wall's index and increment the wall by one. Keep on doing this until you get to
#          the end of the array and you will have it sorted.
#
# Best Case Scenario: O(nlgn). You have a function which perfectly selects the median as the pivot point everytime
# Average Case Scenario: O(nlgn). Randomized data and randomized pivot
# Worst Case Scenario: O(n^2). You have the data in sorted order and you always pick the pivot as the last element.

class QuickSort

  def initialize

    @data = [1, 234, 123, 4, 3, 2, 5, 13, 12]
  end

  # quicksort - conquer part of the algorithm. Sorts the left and right subarrays
  def quicksort(p, r)

    if p < r

      q = partition(@data, p, r)
      quicksort(p, q - 1)
      quicksort(q + 1, r)
    end
  end

  # partition - divide part of the algorithm. Partitions (rearranges) the subarray from index p -> r into two possibly
  #           empty subarrays from p -> q - 1 and q + 1 -> r.
  # @param arr - data set
  # @param p - where the wall currently resides
  # @param r - pivot index
  def partition(arr, p, r)

    pivot_value = arr[r]
    wall_idx = p - 1

    for curr_idx in p..(r - 1)             # Stop one before the pivot inclusive

      if arr[curr_idx] <= pivot_value      # Everything <= the pivot_value goes to the left of the wall

        wall_idx = wall_idx + 1            # Increment the wall
        swap(arr, wall_idx, curr_idx)      # Swap with the wall
      end
    end

    swap(arr, wall_idx + 1, r)             # Swap the pivot index with the wall and increment the wall up

    return (wall_idx + 1)                  # Return the new value of the wall
  end

  def swap(arr, idx1, idx2)

    tmp = arr[idx1]

    arr[idx1] = arr[idx2]
    arr[idx2] = tmp
  end

  def print_info

    puts(@data)
  end
end

qs = QuickSort.new
qs.print_info
qs.quicksort(0, 8)
puts("Sorted")
qs.print_info