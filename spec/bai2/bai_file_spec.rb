# frozen_string_literal: true

RSpec.describe Bai2::BaiFile do
  describe ".parse" do
    subject(:parsed) { described_class.parse(path, **options) }

    let(:options) { {} }

    context "with 'daily' fixture" do
      let(:path) { Fixtures.path("daily.bai2") }

      it "instantiates without error" do
        expect(parsed).to be_a(described_class)
      end
    end

    context "with 'daily_with_summary' fixture" do
      let(:path) { Fixtures.path("daily_with_summary.bai2") }
      let(:options) { {num_account_summary_continuation_records: 3} }

      it "instantiates without error" do
        expect(parsed).to be_a(described_class)
      end
    end

    context "with 'eod' fixture" do
      let(:path) { Fixtures.path("eod.bai2") }

      it "instantiates without error" do
        expect(parsed).to be_a(described_class)
      end
    end
  end
end
