require 'rails_helper'
require 'date'

RSpec.describe Vote, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user)}

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

  describe "#update_rank" do
     it "calculates the correct rank" do
       post.update_rank
       expect(post.rank).to eq (post.points + (Time.current - post.created_at)/ 1.day.seconds).to_i.ceil
   end

   it "updates the rank when an up vote is created" do
     old_rank = post.rank
     post.votes.create!(value: 1, user: user)
     expect(post.rank).to eq(old_rank + 1)
   end

   it "updates the rank when a down vote is created" do
     old_rank = post.rank
     post.votes.create!(value: -1, user: user)
     expect(post.rank).to eq(old_rank - 1)
   end
  end

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end

    it "#update_post should clal update_rank on post" do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end

end
