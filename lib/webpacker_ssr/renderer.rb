# frozen_string_literal: true

require 'webpacker_ssr/server_bundle'

module WebpackerSSR
  class Renderer
    def initialize
      @renderer = WebpackerSSR.config.renderer.new(ServerBundle.read)
    end

    def refresh
      @renderer.refresh(ServerBundle.read)
    end

    def render(code)
      refresh unless Webpacker.config.cache_manifest?
      @renderer.render(code)
    end
  end
end
