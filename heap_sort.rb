# HeapSort:
#   A sorting algorithm belonging to the O(nlg(n)) family with no variation depending on the data


class HeapSort

  def initialize

    @data = [1, 234, 123, 4, 3, 2, 5, 13, 12]
  end

  # sort - the sorting portion of the HeapSort algorithm
  # Intuition : the last half of an array implementation of a heap is just leaves. So build the heap from there going down.
  #           after building the heap the first time, extract the root which we know is a the maximum element, due to a max heap
  #           property, and afterwards swap it with the last element. From there, the last element is now the largest element and
  #           is in the right place. So repeat but setting up a wall with the sorted part of the array and heapify the array except
  #           the last element for the next iteration etc.
  def sort

    arr_len = @data.length
    start_build_idx = arr_len / 2 - 1                                 # The last half of the array is just leaves

    for i in (start_build_idx).downto(0)

      max_heapify(@data, arr_len, i)                                  # Build the heap from the array
    end

    for i in (arr_len-1).downto(0)

      swap(@data, i, 0)                                          # Move the current root to the end of the array
      max_heapify(@data, i, 0)                                 # Heapify the remaining part of the array excluding the root which was just sorted to the end
    end

    puts(@data)
  end

  # max_heapify - builds the max heap required from the array given.
  # @param arr - the array of data
  # @param arr_len - the length of the next heap within the data set (Won't always be arr_len / 2  - 1)
  # @param parent - the index of the parent (root for each call)
  def max_heapify(arr, arr_len, parent)

    largest = parent                                                  # Assume the largest is the root of the subtree
    left_child = 2 * parent + 1                                       # left child's index
    right_child = 2 * parent + 2                                      # right child's index

    if left_child < arr_len && @data[left_child] > @data[largest]     # Check bounds and if left child's index is new largest

      largest = left_child
    end

    if right_child < arr_len && @data[right_child] > @data[largest]   # Check bounds and if right child's index is new largest

      largest = right_child
    end

    if largest != parent                                              # If the largest isn't the root, then we have to swap to maintain the max heap property and re-max-heapify
      swap(arr, largest, parent)                                      # Put the largest element which is the root at the end because it is now in the right place

      max_heapify(arr, arr_len, largest)                              # Going to have to max heapify after switching the root and last element
    end
  end

  # swap - swap helper function
  # @param idx1 - index to be swapped
  # @param idx2 - index to be swapped
  def swap(arr, idx1, idx2)

    tmp = arr[idx1]

    arr[idx1] = arr[idx2]
    arr[idx2] = tmp
  end
end

# Driver
hs = HeapSort.new
hs.sort