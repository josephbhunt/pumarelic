require "puma"
require "puma/plugin"

require_relative "../pumarelic/stats_collector"

Puma::Plugin.create do
  def start(launcher)
    stats_collector = StatsCollector.new(launcher)
    
    launcher.events.register(:state) do |status|
      if %i[halt restart stop].include?(status)
        stats_collector.stop_collecting
      end
    end

    in_background do
      stats_collector.collect
    end

  end
end
