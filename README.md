# RailsHealthMonitor

RailsHealthMonitor is a lightweight Ruby gem for collecting basic application and system health information.

It helps developers verify runtime information such as Ruby version, gem version, hostname, and other health metrics that can be used for monitoring and diagnostics.

This project is developed by Nexovar.

## Features

Current features:

* Gem version reporting
* Ruby version reporting
* Hostname detection
* Lightweight health check API

Planned features:

* Rails version detection
* Database connectivity checks
* Redis connectivity checks
* Sidekiq health checks
* Rails Engine dashboard
* Health endpoint integration

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_health_monitor"
```

And then execute:

```bash
bundle install
```

Or install it directly:

```bash
gem install rails_health_monitor
```

## Usage

```ruby
require "rails_health_monitor"

RailsHealthMonitor.check
```

Example response:

```ruby
{
  ruby_version: "3.4.5",
  rails_version: "8.0.2",
  environment: "production",
  hostname: "web-01",
  timestamp: 2026-06-22 14:30:00 UTC,
  database: {
    status: "ok"
  }
}
```

## Development

Clone the repository and install dependencies:

```bash
bin/setup
```

Run the test suite:

```bash
bundle exec rspec
```

Open an interactive console:

```bash
bin/console
```

## Roadmap

Version 0.1

* Basic health check API
* Ruby runtime information

Version 0.2

* Rails environment information
* Database health checks

Version 0.3

* Redis health checks
* Sidekiq monitoring

Version 1.0

* Rails Engine integration
* Monitoring dashboard
* Production-ready health endpoint

## Contributing

Bug reports, feature requests, and pull requests are welcome.

Please ensure all tests pass before submitting changes.

## License

This project is available as open source under the terms of the MIT License.
