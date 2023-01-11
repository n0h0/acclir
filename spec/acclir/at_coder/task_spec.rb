# frozen_string_literal: true

RSpec.describe Acclir::AtCoder::Task do
  describe "#samples" do
    let!(:contest_id) { "abc999" }
    let!(:id) { "abc999_a" }
    let!(:task) { described_class.new(contest_id, id) }

    before do
      stub_request(:get, "https://atcoder.jp/contests/#{contest_id}/tasks/#{id}").to_return(
        body: File.new(File.expand_path("../../fixtures/task.html", File.dirname(__FILE__))), status: 200
      )
    end

    it "return samples" do
      expect(task.samples).to be_truthy
    end

    it "must be sample input 1 values set" do
      expect(task.samples[0].input).to eq <<~INPUT
        Sample
        Input
        1
      INPUT
    end

    it "must be sample output 1 values set" do
      expect(task.samples[0].output).to eq <<~OUTPUT
        Sample
        Output
        1
      OUTPUT
    end

    it "must be sample input 2 values set" do
      expect(task.samples[1].input).to eq <<~INPUT
        Sample
        Input
        2
      INPUT
    end

    it "must be sample output 2 values set" do
      expect(task.samples[1].output).to eq <<~OUTPUT
        Sample
        Output
        2
      OUTPUT
    end
  end
end
