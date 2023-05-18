class StatsCollector

  def initialize(launcher)
    @launcher = launcher
    @collecting = false

    raise "Puma is not configured! " unless NewRelic::Agent.config[:puma]

    @stats_to_collect = NewRelic::Agent.config[:puma]['collect'].map(&:to_sym)
  end

  def collect
    @collecting = true
    while @collecting do
      sleep 5
      break if @launcher.nil?

      @launcher.stats.key?(:workers) ? collect_cluster_stats : collect_stats(@launcher.stats)
      
    end
  end

  def stop_collecting
    @collecting = false
  end

  private

  def collect_cluster_stats
    @launcher.stats[:workers].each do |worker|
      collect_stats(worker[:last_status])
    end
  end

  def collect_stats(stats)
    stats.each do |key, value|
      NewRelic::Agent.record_metric("Custom/Puma/#{key}", value) if @stats_to_collect.include?(key)
    end
  end
end
