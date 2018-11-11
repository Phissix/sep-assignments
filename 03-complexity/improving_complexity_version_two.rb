# Function takes n arrays as input and combine them in sorted ascending  order
def time_complexity(*arrays)
   combined_array = arrays.flatten!

   if combined_array.length <= 1
     return combined_array
   else
     mid = (combined_array.length / 2). floor
     left = merge_sort(combined_array[0..mid - 1])
     right = merge_sort(combined_array[mid..combined_array.length])
     merge(left, right)
   end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end
