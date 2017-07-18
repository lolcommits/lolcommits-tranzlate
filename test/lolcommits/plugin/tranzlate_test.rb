require 'test_helper'

describe Lolcommits::Plugin::Tranzlate do

  include Lolcommits::TestHelpers::GitRepo
  include Lolcommits::TestHelpers::FakeIO

  it 'should have a name' do
    ::Lolcommits::Plugin::Tranzlate.name.must_equal 'tranzlate'
  end

  it 'should run on post capturing' do
    ::Lolcommits::Plugin::Tranzlate.runner_order.must_equal [:pre_capture]
  end

  describe 'with a runner' do
    def runner
      # a simple lolcommits runner with an empty configuration Hash
      @runner ||= Lolcommits::Runner.new(
        config: OpenStruct.new(read_configuration: {})
      )
    end

    def plugin
      @plugin ||= Lolcommits::Plugin::Tranzlate.new(runner: runner)
    end

    def valid_enabled_config
      @config ||= OpenStruct.new(
        read_configuration: {
          plugin.class.name => { 'enabled' => true }
        }
      )
    end

    describe 'initalizing' do
      it 'should assign runner and an enabled option' do
        plugin.runner.must_equal runner
        plugin.options.must_equal ['enabled']
      end
    end

    describe '#enabled?' do
      it 'should be false by default' do
        plugin.enabled?.must_equal false
      end

      it 'should true when configured' do
        plugin.config = valid_enabled_config
        plugin.enabled?.must_equal true
      end
    end

    describe '#run_pre_capture' do
      before { commit_repo_with_message('my awesome commit') }

      it 'should tranzlate the commit message' do
        in_repo { plugin.run_pre_capture }
        runner.message.must_match(/AWESUM COMMIT/)
      end

      after { teardown_repo }
    end
  end
end
