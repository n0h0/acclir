# frozen_string_literal: true

RSpec.describe Acclir::AtCoder::Contest do
  describe "#tasks" do
    let!(:id) { "abc999" }
    let!(:contest) { described_class.new(id) }

    before do
      stub_request(:get, "https://atcoder.jp/contests/#{id}/tasks").to_return(
        body: File.new(File.expand_path("../../fixtures/contest.html", File.dirname(__FILE__))), status: 200
      )
    end

    it "return tasks" do
      expect(contest.tasks).to be_truthy
    end

    it "must be return 2 tasks" do
      expect(contest.tasks.size).to eq 2
    end

    it "must be set task id" do
      expect(contest.tasks.map(&:id)).to match_array %w[abc999_a abc999_b]
    end
  end
end
