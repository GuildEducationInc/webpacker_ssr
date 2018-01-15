# frozen_string_literal: true

module WebpackerSSR
  class Configuration
    attr_reader :renderer, :server_bundle
    attr_accessor :renderers, :server_manifest

    def initialize
      @renderers = {}
    end

    def renderer=(candidate)
      if candidate.is_a?(Class)
        @renderer = candidate
      else
        candidate = candidate.to_sym
        @renderer = renderers[candidate] if renderers.key?(candidate)
      end
    end

    def server_bundle=(name)
      base = File.basename(name, File.extname(name))
      @server_bundle = "#{base}.js"
      @server_manifest ||= "#{base}.json"
    end
  end
end
