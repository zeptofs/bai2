# frozen_string_literal: true

RSpec.describe Bai2::BaiFile do
  describe ".parse" do
    subject(:parsed) { described_class.parse(path) }

    context "with 'daily' fixture" do
      let(:path) { Fixtures.path("daily.bai2") }

      it "instantiates without error" do
        expect(parsed).to be_a(described_class)
      end
    end
  end
end
