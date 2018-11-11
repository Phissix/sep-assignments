require_relative 'city'


class TsGreed
	attr_reader :root
	attr_reader :city_array

	def initialize
		@city_array = []
		@root = nil
		@updated = false
	end


	def add_node(node)
		# create
		if @city_array == []
			@city_array.push(node)
			@root = node

		#if city already in array
    elsif @city_array.include?(node)
			puts "The city already exists"

		#append and clear
		else
			@city_array.push(node)
			clear_ts
		end
	end

	# delete func
	def delete_node(node)
		if @city_array.include?(node)
			@city_array.delete(node)
			if node == @root
				@root = @city_array[0]
			end
			clear_ts
		else
			puts "That node isn't included"
		end
	end

	#set new
	def set_root(node)
		@root = node
		clear_ts
	end

  #search
	def find_node_by_name(name)
		@city_array.each do |node|
			if node.name == name
				return node
			end
		end
		return
	end

	#tracks neighbors
	def create_ts

		clear_ts

		first_node = @root
		current_node = @root

		nodes_left = @city_array.dup
		nodes_left.delete(current_node)

		while nodes_left != []
			next_node = nil
			closest_distance = nil

			nodes_left.each do |node|
		    #line distance
				temp_distance = line_distance(current_node, node)

				#next node comparison
				if !next_node || temp_distance < closest_distance
					next_node = node
					closest_distance = temp_distance
				end
			end

			#set next
			current_node.next = next_node
			current_node = next_node

			#remove next_node
			nodes_left.delete(current_node)
		end

		#first node and the last node
		current_node.next = first_node

		#current graph
		@updated = true
	end

	def print_ts
		if !@updated
			puts "The graph isn't up to date"
		else

			current_node = @root
			while current_node.next != @root
				puts current_node.name
				#make current next
				current_node = current_node.next
			end

			puts current_node.name
			return
		end
	end


	private

	def clear_ts
		@city_array.each do |node|
			node.previous = nil
			node.next = nil
		end
		@update = false
	end

	#magnitude of distance between 2 points
	def line_distance(node_one, node_two)
		x_one = node_one.position[0]
		x_two = node_two.position[0]

		y_one = node_one.position[1]
		y_two = node_two.position[1]

		Math.hypot(x_one - x_two, y_one - y_two)
	end

end

#run
node_one = City.new("toronto", [0, 0])
node_two = City.new("vancouver", [-2000, 50])
node_three = City.new("ottawa", [5, 2])
node_four = City.new("calgary", [-1000, 60])
node_five = City.new("montreal", [10, 3])
greed_graph = TsGreed.new

[node_one, node_two, node_three, node_four, node_five].each do |node|
	greed_graph.add_node(node)
end
greed_graph.create_ts
greed_graph.print_ts
