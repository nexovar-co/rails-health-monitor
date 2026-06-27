# frozen_string_literal: true

RSpec.describe RailsHealthMonitor do
  it "has a version number" do
    expect(RailsHealthMonitor::VERSION).not_to be_nil
  end

  it "returns health information" do
    result = RailsHealthMonitor.check

    puts "Result: #{result.inspect}" # Debugging line to print the result
    expect(result[:ruby_version]).to eq(RUBY_VERSION)
    expect(result[:hostname]).to eq(Socket.gethostname)
    expect(result[:timestamp]).to be_a(Time)
    expect(result[:rails_version]).to eq(defined?(Rails) ? Rails.version : nil)
    expect(result[:environment]).to eq(defined?(Rails) ? Rails.env : nil)
    expect(result[:database]).to eq({ status: "not_configured" })
  end
end
