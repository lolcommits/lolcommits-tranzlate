# frozen_string_literal: true

require "lolcommits/plugin/base"
require "lolcommits/tranzlate/lolspeak"

module Lolcommits
  module Plugin
    class Tranzlate < Base
      extend Lolcommits::Tranzlate::Lolspeak

      ##
      #
      # Pre-capture hook, runs after lolcommits captures.
      #
      # Translate the commmit message with lolspeak
      #
      def run_pre_capture
        debug "Commit message before: #{runner.message}"
        runner.message = self.class.tranzlate(runner.message)
        debug "Commit message after: #{runner.message}"
      end
    end
  end
end
