require_relative './test_helper'
# require_relative "../lib/pumarelic/puma/stats_collector/stats_collector"

describe "StatsCollector" do
  before do
    @launcher = mock
    @launcher.stubs(:stats).returns({:backlog=>0, :running=>0, :pool_capacity=>16, :max_threads=>16})
  end

  it "raises an error if puma is not configured for NewRelic" do
    NewRelic::Agent.stubs(:config).returns({})
    assert_raises RuntimeError do
      @stats = StatsCollector.new(@launcher)
    end
  end
end
