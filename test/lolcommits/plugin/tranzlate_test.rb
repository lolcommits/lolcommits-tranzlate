require 'test_helper'

describe Lolcommits::Plugin::Tranzlate do

  include Lolcommits::TestHelpers::GitRepo
  include Lolcommits::TestHelpers::FakeIO

  describe 'with a runner' do
    def runner
      @runner ||= Lolcommits::Runner.new
    end

    def plugin
      @plugin ||= Lolcommits::Plugin::Tranzlate.new(runner: runner)
    end

    describe '#enabled?' do
      it 'returns false by default' do
        plugin.enabled?.must_equal false
      end

      it 'returns true when configured' do
        plugin.configuration = { enabled: true }
        plugin.enabled?.must_equal true
      end
    end

    describe '#run_pre_capture' do
      before { commit_repo_with_message('my awesome commit') }

      it 'tranzlates the commit message' do
        in_repo { plugin.run_pre_capture }
        runner.message.must_match(/AWESUM COMMIT/)
      end

      after { teardown_repo }
    end
  end
end
