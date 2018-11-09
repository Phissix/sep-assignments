def nearest_neighbor(cities, target_city, path_array)
  cities[target_city][-1] = true
  closest_distance = 5000000
  index_of_closest = nil

  while path_array.length < cities.length - 1
    cities.each_with_index do |city, index|
      distance = line_distance(cities[target_city][0], city[1][0])
      if distance < closest_distance && distance > 0 && city[1][1] != true
        closest_distance = distance
        index_of_closest = index
      end
    end
    path_array << cities.keys[index_of_closest]
    nearest_neighbor(cities, cities.keys[index_of_closest], path_array)
  end
  path_array
end

def line_distance(city_1, city_2)
  Math.sqrt(((city_1[0] - city_2[0])**2 + (city_1[1] - city_2[1])**2))
end

can_map = {
  :montreal => [[10, 3], false],
  :calgary => [[-1000, 60], false],
  :detroit => [[-5, -5], false],
  :toronto => [[0, 0], false],
  :vancouver => [[-2000, 50], false],
  :ottawa => [[5, 2], false]
}

puts nearest_neighbor(can_map, :toronto, [])
