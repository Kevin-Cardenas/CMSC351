class MaxSubArraySum

  def initialize

    @data = [3, -4, 6, 1, -2, 4, 3]                 # max sub-array sum is 12 (@data[2] -> @data[6])
  end

  # brute_force - brute forces the maximum sub-array sum in O(n^3)
  # Intuition: track every single possible sum
  # @return maximum sub-array sum
  def brute_force

    max_sum = 0                                     # max sub-array sum defaults to 0
    n = @data.length - 1

    for i in 0..n do
      for j in i..n do

        curr_sum = 0                                # track this current sub-array sum
        for k in i..j do                            # checking all the possible sums from i -> j (j goes up to length - 1)

          curr_sum += @data[k]
          max_sum = max(max_sum, curr_sum)          # check if the max is < the sum just calculated
        end
      end
    end

    puts("Brute Force Solution in O(n^3) : " + max_sum.to_s)
  end

  # better_solution - slightly improves on the brute force solution by going to O(n^2)
  # Intuition: prevent recalculating previous sums by storing them once calculated
  # @return maximum sub-array sum
  def better_solution

    max_sum = 0
    n = @data.length - 1

    for i in 0..n do

      curr_sum = 0
      for j in i..n do                              # difference is here, don't need to recalculate values (j -> (i to length - 1)

        curr_sum += @data[j]
        max_sum = max(max_sum, curr_sum)
      end
    end

    puts("Better Solution in O(n^2) : " + max_sum.to_s)
  end

  # optimal_solution - best solution by going to O(n)
  # Intuition: the new maximum sum is just the max of the previous maximum sum and 0 (make sure we don't decrease the max sum)
  # @return maximum sub-array sum
  def optimal_solution

    max_sum = 0
    curr_sum = 0
    n = @data.length - 1

    for i in 0..n do                                # Only one loop

      curr_sum = max(curr_sum + @data[i], 0)    # max with 0 to make sure the maximum sum isn't dipping into the negatives
      max_sum = max(max_sum, curr_sum)
    end

    puts("Optimal Solution in O(n) : " + max_sum.to_s)
  end

  # max - helper function to find the max value
  # @param n1 - first number
  # @param n2 - second number
  # @return the maximum between n1 and n2
  def max(n1, n2)

    return n1 > n2 ? n1 : n2
  end
end

# Driver

ms = MaxSubArraySum.new
ms.brute_force
ms.better_solution
ms.optimal_solution