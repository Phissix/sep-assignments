# Function takes n arrays as input and combine them in sorted ascending  order
def code_optimization(*arrays)
 combined_array = arrays.flatten!

 sorted_array = [combined_array.delete_at(0)]

 for val in combined_array
   i = 0
   array_length = sorted_array.length
   while i < array_length
     if val <= sorted_array[i]
       sorted_array.insert(i, val)
       break
     elsif i == array_length - 1
       sorted_array << val
       break
     end
     i+=1
   end
 end

 # Return the sorted array
 sorted_array
end
