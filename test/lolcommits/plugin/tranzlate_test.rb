require 'test_helper'

describe Lolcommits::Plugin::Tranzlate do

  include Lolcommits::TestHelpers::GitRepo
  include Lolcommits::TestHelpers::FakeIO

  it 'should run on post capturing' do
    ::Lolcommits::Plugin::Tranzlate.runner_order.must_equal [:pre_capture]
  end

  describe 'with a runner' do
    def runner
      @runner ||= Lolcommits::Runner.new
    end

    def plugin
      @plugin ||= Lolcommits::Plugin::Tranzlate.new(runner: runner)
    end

    describe '#enabled?' do
      it 'should be false by default' do
        assert_nil plugin.enabled?
      end

      it 'should true when configured' do
        plugin.configuration = { enabled: true }
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
