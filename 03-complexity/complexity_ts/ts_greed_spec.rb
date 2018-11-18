include RSpec

require_relative 'ts_greed'

RSpec.describe TsGreed, type: Class  do

  #hard test case
	let (:graph) {TsGreed.new}
	let (:node_one) {City.new("one", [3, 2])}
	let (:node_two) {City.new("two", [-3, -2])}
	let (:node_three) {City.new("three", [-3, 2])}
	let (:node_four) {City.new("four", [3, -2])}


	describe "#add_node" do
		it "adds first node as root" do
			graph.add_node(node_one)
			expect(graph.root).to eq(node_one)
		end

		it "adds multiple nodes" do
			graph.add_node(node_one)
			graph.add_node(node_two)
			graph.add_node(node_three)
			expect(graph.city_array.length).to eq(3)
		end
 	end

 	describe "#remove node" do
 		it "removes a node when multiple nodes" do
 			graph.add_node(node_one)
 			graph.add_node(node_two)
 			expect(graph.city_array.length).to eq(2)

 			graph.delete_node(node_two)
 			expect(graph.city_array.length).to eq(1)
 		end

 		it "changes root if you delete the root" do
 			graph.add_node(node_one)
 			graph.add_node(node_two)

 			graph.delete_node(node_one)
 			expect(graph.root).to eq(node_two)
 		end

 		it "emptys array if you delete only node" do
 			graph.add_node(node_one)
 			expect(graph.root).to eq(node_one)

 			graph.delete_node(node_one)
 			expect(graph.city_array).to eq([])
 		end
 	end

 	describe "#set_root" do
 		it "changes the root" do
 			graph.add_node(node_one)
 			expect(graph.root).to eq(node_one)

 			graph.add_node(node_two)
 			graph.set_root(node_two)

 			expect(graph.root).to eq(node_two)
 		end
 	end

 	describe "#find by name" do

 		before do
 			graph.add_node(node_one)
 			graph.add_node(node_two)
 			graph.add_node(node_three)
 			graph.add_node(node_four)
 		end

 		it "finds a node by name" do
 			expect(graph.find_node_by_name("three")).to eq(node_three)
 		end

 		it "doesn't find a node that doesn't exist" do
 			expect(graph.find_node_by_name("five")).to be_nil
 		end
 	end

 	describe "#create_graph" do
 		it "makes the graph correctly" do
	 		graph.add_node(node_one)
	 		graph.add_node(node_two)
	 		graph.add_node(node_three)
	 		graph.add_node(node_four)
	 		graph.create_ts

	 		expect(graph.root).to eq(node_one)
	 		expect(graph.root.next).to eq(node_four)
	 		expect(graph.root.next.next).to eq(node_two)
	 		expect(graph.root.next.next.next).to eq(node_three)
 		end
 	end

end
