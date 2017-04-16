require 'lolcommits/plugin/base'
require 'lolcommits/tranzlate/lolspeak'

module Lolcommits
  module Plugin
    class Tranzlate < Base
      extend Lolcommits::Tranzlate::Lolspeak

      ##
      # Returns the name of the plugin. Identifies the plugin to lolcommits.
      #
      # @return [String] the plugin name
      #
      def self.name
        'tranzlate'
      end

      # Returns position(s) of when this plugin should run during the capture
      # process.
      #
      # @return [Array] the position(s) (:precapture and/or :postcapture)
      #
      def self.runner_order
        [:precapture]
      end

      ##
      #
      # Pre-capture hook, runs after lolcommits captures a snapshot.
      #
      # Translate the commmit message with lolspeak
      #
      def run_precapture
        debug "Commit message before: #{runner.message}"
        runner.message = self.class.tranzlate(runner.message)
        debug "Commit message after: #{runner.message}"
      end
    end
  end
end
