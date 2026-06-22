# frozen_string_literal: true

RSpec.describe RailsHealthMonitor do
  it "has a version number" do
    expect(RailsHealthMonitor::VERSION).not_to be_nil
  end

  it "returns health information" do
    result = RailsHealthMonitor.check

    expect(result[:ruby_version]).to eq(RUBY_VERSION)
  end
end