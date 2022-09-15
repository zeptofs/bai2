# frozen_string_literal: true

RSpec.describe Bai2::BaiFile do
  describe ".parse" do
    subject(:parsed) { described_class.parse(path, **options) }

    shared_examples "a parsable format" do
      it "instantiates without error" do
        expect(parsed).to be_a(described_class)
      end

      it "has one group with expected originator", :aggregate_failures do
        expect(parsed.groups).to be_a(Array)
        expect(parsed.groups.length).to eq(1)
        group = parsed.groups.first
        expect(group).to be_a(described_class::Group)
        expect(group.originator).to eq("121140399")
      end

      it "imports an account" do
        accounts = parsed.groups.first.accounts
        expect(accounts).to be_a(Array)
        expect(accounts.length).to eq(1)
        expect(accounts.first).to be_a(described_class::Account)
      end
    end

    context "with 'daily' fixture" do
      let(:path) { Fixtures.path("daily.bai2") }
      let(:options) { {} }

      it_behaves_like "a parsable format"

      it "sets expected destination" do
        expect(parsed.groups.first.destination).to eq("9999999999")
      end

      it "imports a transaction" do
        transactions = parsed.groups.first.accounts.first.transactions
        expect(transactions).to be_a(Array)
        expect(transactions.length).to eq(1)
        expect(transactions.first).to be_a(described_class::Transaction)
        expect(transactions.first.type).to eq(
          code: 174,
          transaction: :credit,
          scope: :detail,
          description: "Other Deposit"
        )
      end
    end

    context "with 'daily_with_summary' fixture" do
      let(:path) { Fixtures.path("daily_with_summary.bai2") }
      let(:options) { {num_account_summary_continuation_records: 3} }

      it_behaves_like "a parsable format"
    end

    context "with 'eod' fixture" do
      let(:path) { Fixtures.path("eod.bai2") }
      let(:options) { {} }

      it_behaves_like "a parsable format"

      it "sets expected destination" do
        expect(parsed.groups.first.destination).to eq("3333333333")
      end

      it "imports a transaction" do
        transactions = parsed.groups.first.accounts.first.transactions
        expect(transactions).to be_a(Array)
        expect(transactions.length).to eq(1)
        expect(transactions.first).to be_a(described_class::Transaction)
        expect(transactions.first.type).to eq(
          code: 195,
          transaction: :credit,
          scope: :detail,
          description: "Incoming Money Transfer"
        )
      end
    end

    context "with 'eod_without_as_of_time' fixture" do
      let(:path) { Fixtures.path("eod_without_as_of_time.bai2") }
      let(:options) { {} }

      it_behaves_like "a parsable format"
    end

    context "with 'eod_with_slash_in_text' fixture" do
      let(:path) { Fixtures.path("eod_with_slash_in_text.bai2") }
      let(:options) { {continuations_slash_delimit_end_of_line_only: true} }

      it_behaves_like "a parsable format"
    end

    context "with 'group_trailer_without_number_of_accounts' fixture" do
      let(:path) { Fixtures.path("group_trailer_without_number_of_accounts.bai2") }
      let(:options) { {group_trailer_without_number_of_accounts: true} }

      it_behaves_like "a parsable format"
    end
  end
end
