# frozen_string_literal: true

require 'webpacker_ssr/server_manifest'

module WebpackerSSR
  class ServerBundle
    def self.read
      manifest = ServerManifest.new
      asset_path = manifest.lookup(WebpackerSSR.config.server_bundle).to_s
      Webpacker.dev_server.running? ? load_from_dev_server(asset_path) : load_from_file(asset_path)
    end

    def self.load_from_dev_server(asset_path)
      ds = Webpacker.dev_server
      open("#{ds.protocol}://#{ds.host_with_port}#{asset_path}").read
    end
    private_class_method :load_from_dev_server

    def self.load_from_file(asset_path)
      File.read(::Rails.root.join('public', asset_path[1..-1]))
    end
    private_class_method :load_from_file
  end
end
