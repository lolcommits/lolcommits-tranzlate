# frozen_string_literal: true

require 'test_helper'

class TestLolcommitsPluginTranzlate < Minitest::Test
  include Lolcommits::TestHelpers::GitRepo
  include Lolcommits::TestHelpers::FakeIO

  def test_enabled_returns_false_by_default
    refute plugin.enabled?
  end

  def test_enabled_returns_true_when_configured
    plugin.configuration = { enabled: true }
    assert plugin.enabled?
  end

  def test_run_pre_capture_tranzlates_commit_message
    commit_repo_with_message("my awesome commit")
    in_repo { plugin.run_pre_capture }

    assert_match /AWESUM COMMIT/, runner.message

    teardown_repo
  end

  private
    def runner
      @runner ||= Lolcommits::Runner.new
    end

    def plugin
      @plugin ||= Lolcommits::Plugin::Tranzlate.new(runner: runner)
    end
end
