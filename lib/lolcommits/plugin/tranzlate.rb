require 'lolcommits/plugin/base'
require 'lolcommits/tranzlate/lolspeak'

module Lolcommits
  module Plugin
    class Tranzlate < Base
      extend Lolcommits::Tranzlate::Lolspeak

      # Returns position(s) of when this plugin should run during the capture
      # process.
      #
      # We want to change the commit message text before the capture happens.
      #
      # @return [Array] the position(s) (:pre_capture)
      #
      def self.runner_order
        [:pre_capture]
      end

      ##
      #
      # Pre-capture hook, runs after lolcommits captures a snapshot.
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
