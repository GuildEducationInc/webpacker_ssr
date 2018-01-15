# frozen_string_literal: true

require 'webpacker'
require 'webpacker_ssr/configuration'
require 'webpacker_ssr/renderer'
require 'webpacker_ssr/version'

module WebpackerSSR
  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end

    def register_renderer(name, klass)
      config.renderers[name] = klass
    end

    def register_configuration(name, target)
      config.send(:define_singleton_method, name) do
        target
      end
    end

    def renderer
      @renderer ||= Renderer.new
    end

    def render(*args)
      renderer.render(*args)
    end
  end
end
