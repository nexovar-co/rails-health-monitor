# frozen_string_literal: true

require_relative "rails_health_monitor/version"

module RailsHealthMonitor
  class Error < StandardError; end
  
  def self.check
    {
      ruby_version: RUBY_VERSION
    }
  end
end
