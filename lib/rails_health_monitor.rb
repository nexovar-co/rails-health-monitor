# frozen_string_literal: true

require_relative "rails_health_monitor/version"
require "socket"

module RailsHealthMonitor
  class Error < StandardError; end
  
  def self.check
    {
      ruby_version: RUBY_VERSION,
      rails_version: defined?(Rails) ? Rails.version : nil,
      hostname: Socket.gethostname,
      timestamp: Time.now.utc
    }
  end
end
