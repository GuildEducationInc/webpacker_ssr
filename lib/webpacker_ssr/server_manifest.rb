# frozen_string_literal: true

module WebpackerSSR
  class ServerManifest < ::Webpacker::Manifest
    def initialize
      super Webpacker.instance
    end

    private

    def load
      public_manifest_path = config.public_output_path.join(WebpackerSSR.config.server_manifest)
      if public_manifest_path.exist?
        JSON.parse public_manifest_path.read
      else
        {}
      end
    end
  end
end
