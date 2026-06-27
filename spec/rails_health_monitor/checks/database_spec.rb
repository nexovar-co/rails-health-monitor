# frozen_string_literal: true

RSpec.describe RailsHealthMonitor::Checks::Database do
  context "when ActiveRecord is not defined" do
    before do
      hide_const("ActiveRecord::Base")
    end

    it "returns not_configured status" do
      result = described_class.call
      expect(result[:status]).to eq("not_configured")
    end
  end

  context "when ActiveRecord is defined" do
    let(:mock_connection) { double("ActiveRecord::Connection") }

    before do
      stub_const("ActiveRecord::Base", Class.new)
      allow(ActiveRecord::Base).to receive(:connection).and_return(mock_connection)
    end

    context "when the database connection is active" do
      before do
        allow(mock_connection).to receive(:active?).and_return(true)
      end

      it "returns ok status" do
        result = described_class.call
        expect(result[:status]).to eq("ok")
      end
    end

    context "when the database connection is not active" do
      before do
        allow(mock_connection).to receive(:active?).and_return(false)
      end

      it "returns error status" do
        result = described_class.call
        expect(result[:status]).to eq("error")
      end
    end

    context "when an exception occurs while checking the database connection" do
      before do
        allow(mock_connection).to receive(:active?).and_raise(StandardError.new("Database error"))
      end

      it "returns error status with message" do
        result = described_class.call
        expect(result[:status]).to eq("error")
        expect(result[:message]).to eq("Database error")
      end
    end
  end
end
