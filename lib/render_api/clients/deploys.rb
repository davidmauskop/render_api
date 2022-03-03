# frozen_string_literal: true

require_relative "./base"

module RenderAPI
  module Clients
    class Deploys < Base
      def create(service_id, clear_cache: nil)
        body = nil
        body = { clearCache: clear_cache } unless clear_cache.nil?

        endpoint.post(
          "/services/#{service_id}/deploys", body: body
        )
      end

      def find(service_id, deploy_id)
        endpoint.get(
          "/services/#{service_id}/deploys/#{deploy_id}"
        )
      end

      def list(service_id, limit: nil, cursor: nil, filters: nil)
        endpoint.get(
          "/services/#{service_id}/deploys",
          params: list_parameters(limit: limit, curosr: cursor, filters: filters)
        )
      end
    end
  end
end
