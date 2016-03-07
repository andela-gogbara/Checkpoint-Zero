require_relative "bs_tree.rb"
describe Node do

  context '.new(10)' do
    subject { Node.new(10) }
    context "Node value" do
      it { expect(subject.value).to eq(10) }
    end
  end

  context ".insert" do
    subject { Node.new(10) }

    context "When inserting 3 - a value less than the node's value" do

      before(:each) { subject.insert(3) }

      it "Left Node" do
        expect(subject.left).to be_instance_of Node
      end

      context "Parent value of left node" do
        it { expect(subject.left.parent.value).to eq 10}
      end

      context "Left node value" do
        it { expect(subject.left.value).to eq 3}
      end

      context "Right node" do
        it { expect(subject.right).to be_nil }
      end
    end

    context "When inserting 12 - a value greater than the node's value" do

      before(:each) { subject.insert(12) }

      context "Right Node" do
        it { expect(subject.right).to be_instance_of Node }
      end

      context "Parent value of right node" do
        it { expect(subject.right.parent.value).to eq 10}
      end

      context "Right node value" do
        it { expect(subject.right.value).to eq(12) }
      end

      context "Left node" do
        it { expect(subject.left).to be_nil }
      end
    end
  end
end

describe Tree do

  let(:tree){ Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324] ) }

  describe '.breadth_first_search' do

    context "When searching for 7" do

      let(:result) { tree.breadth_first_search(7) }

      context "Current node value" do
        it { expect(result.value).to eq 7 }
      end

      context "Left node value" do
        it { expect(result.left.value).to eq 5 }
      end

      context "Right node value" do
        it { expect(result.right.value).to eq 23 }
      end

      context "Parent node value" do
        it { expect(result.parent.value).to eq 4}
      end

      context "Node " do
        it { expect(result.to_s).to eq "(5 <= (7) => 23) => 4"}
      end
    end

    context "When searching for 100" do

      let(:result) { tree.breadth_first_search(100) }

      context "Current node" do
        it { expect(result).to be_nil }
      end
    end
  end

  describe '.depth_first_search' do

    context "When searching for 4" do

      let(:result) { tree.depth_first_search(4) }

      context "Current node value" do
        it { expect(result.value).to eq 4 }
      end

      context "Left node value" do
        it { expect(result.left.value).to eq 1 }
      end

      context "Right node value" do
        it { expect(result.right.value).to eq 7 }
      end

      context "Parent node" do
        it { expect(result.parent).to be_nil }
      end

      context "Node " do
        it { expect(result.to_s).to eq "(1 <= (4) => 7) => "}
      end
    end

    context "When searching for 997" do

      let(:result) { tree.depth_first_search(997) }

      context "Current node" do
        it { expect(result).to be_nil }
      end
    end
  end

  describe '.dfs_rec' do

    context "When searching for 23" do

      let(:result) { tree.dfs_rec(23) }

      context "Current node value" do
        it { expect(result.value).to eq 23}
      end

      context "Left node value" do
        it { expect(result.left.value).to eq 8 }
      end

      context "Right node value" do
        it { expect(result.right.value).to eq 67 }
      end

      context "Parent node value" do
        it { expect(result.parent.value).to eq 7 }
      end

      context "Node " do
        it { expect(result.to_s).to eq "(8 <= (23) => 67) => 7"}
      end
    end

    context "When searching for 80" do

      let(:result) { tree.dfs_rec(80) }

      context "Current node" do
        it { expect(result).to be_nil }
      end
    end
  end
end
