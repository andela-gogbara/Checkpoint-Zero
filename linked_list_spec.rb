require_relative "linked_l"
describe "Linked Lists" do
  it "is an empty list with no head" do
    list = LinkedList.new

    expect(list.nil?).to eql(false)
    expect(list.head).to eql(nil)
  end

  it "is a list with a head with data" do
    list = LinkedList.new("head")

    expect(list.head.data).to eql("head")
  end

  it "is a list has a tail with data" do
    list = LinkedList.new("node1")

    expect(list.tail.data).to eql("node1")
  end

  it "has a head when a node is appended on an empty list" do
    list = LinkedList.new

    list.append("head")

    expect(list.head.data).to eql("head")
  end

  it "list has head, tail, and next node when it is created with a head and has 1 node appended" do
    list = LinkedList.new("head")

    list.append("node1")

    expect(list.head.data).to eql("head")
    expect(list.head.next_node.data).to eql("node1")
    expect(list.tail.data).to eql("node1")
  end

  it "has the correct head with one node prepended" do
    list = LinkedList.new("node1")

    list.prepend("node2")

    expect(list.head.data).to eql("node2")
  end

  it "test list with two items prepended" do
    list = LinkedList.new

    list.prepend("node1")
    list.prepend("node2")

    expect(list.head.data).to eql("node2")
    expect(list.head.next_node.data).to eql("node1")
  end

  it "test list with two nodes appended" do
    list = LinkedList.new("node")

    list.append("node1")
    list.append("node2")

    expect(list.head.data).to eql("node")
    expect(list.head.next_node.data).to eql("node1")
    expect(list.head.next_node.next_node.data).to eql("node2")
  end


  it "test find tail with two nodes appended" do
    list = LinkedList.new("node")

    list.append("node1")
    list.append("node2")

    expect(list.tail.data).to eql("node2")
  end

  it "test list tail with 5 nodes on the list" do
    list = LinkedList.new("node")

    list.append("node1")
    list.append("node2")
    list.append("node3")
    list.append("node4")

    expect(list.head.data).to eql("node")
    expect(list.head.next_node.next_node.data).to eql("node2")
    expect(list.tail.data).to eql("node4")
  end

  it "has the right head and tail with 5 total nodes appended and prepended" do
    list = LinkedList.new("node")

    list.append("node1")
    list.append("node2")
    list.append("node3")
    list.prepend("node4")

    expect(list.head.data).to eql("node4")
    expect(list.tail.data).to eql("node3")
  end

  it "can return the list's count" do
    list = LinkedList.new("node")

    expect(list.count).to eql(1)

    list.append("node1")

    expect(list.count).to eql(2)

    list.prepend("node2")
    list.prepend("node3")

    expect(list.count).to eql(4)
  end

  it "can insert a node into the middle of the list" do
    list = LinkedList.new("head")

    list.append("a")
    list.append("b")
    list.append("d")
    list.insert(3, "c")

    expect(list.head.next_node.next_node.next_node.data).to eql("c")
    expect(list.head.next_node.next_node.next_node.next_node.data).to eql("d")
    expect(list.count).to eql(5)
  end

  it "the list can insert to middle after using prepend" do
    list = LinkedList.new("c")

    list.prepend("a")
    list.prepend("head")

    expect(list.head.data).to eql("head")

    list.insert(2, "b")

    expect(list.head.next_node.next_node.data).to eql("b")
    expect(list.head.next_node.next_node.next_node.data).to eql("c")
  end

  it "can pop it like it's hot" do
    list = LinkedList.new

    list.append("head")
    list.append("b")
    popped_off_node = list.pop

    expect(popped_off_node.data).to eql("b")
    expect(list.head.data).to eql("head")
    expect(list.head.next_node).to be_nil
    expect(list.count).to eql(1)
  end

  it "can find a node when given a value" do
    list = LinkedList.new("head")

    list.append("a")
    list.append("b")
    list.append("c")
    b_node = list.find_by_value("b")
    c_node = list.find_by_value("c")

    expect(b_node.data).to eql("b")
    expect(c_node.data).to eql("c")
  end

  it "can remove a node when given a value" do
    list = LinkedList.new("head")

    list.append("a")
    list.append("b")
    list.append("c")
    nil_return = list.remove_by_value("b")

    expect(nil_return).to eql(nil)
    expect(list.head.data).to eql("head")
    expect(list.head.next_node.data).to eql("a")
    expect(list.head.next_node.next_node.data).to eql("c")
    expect(list.tail.data).to eql("c")
    expect(list.count).to eql(3)
   end

  it "can check the existence of node data" do
    list = LinkedList.new("head")
    list.append("node1")

    expect(list.include?("node1")).to eql(true)
    expect(list.include?("asdf")).to eql(false)
  end

  it "can draw itself with nodes using -> thingies" do
    list = LinkedList.new("head")

    expect(list.draw_list).to eql("head")

    list.append("node1")
    list.append("node2")
    list.append("node3")

    expect(list.draw_list).to eql("head -> node1 -> node2 -> node3")
  end
end
