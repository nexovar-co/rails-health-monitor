# frozen_string_literal: true

module RailsHealthMonitor
  module Checks
    class Database
      def self.call
        unless defined?(ActiveRecord::Base)
          return {
            status: "not_configured"
          }
        end

        if ActiveRecord::Base.connection.active?
          { status: "ok" }
        else
          { status: "error" }
        end
      rescue StandardError => e
        {
          status: "error",
          message: e.message
        }
      end
    end
  end
end
