module Api
  module V1
    class StatusController < ApplicationController
      def change
        require "net/http"
        require "json"

        domain = params[:domain]
        token = params[:token]
        status_text = params[:status_text]
        status_emoji = params[:status_emoji]

        slack_api_root="https://#{domain}.slack.com/api"

        profile = { profile: {status_text: status_text, status_emoji: status_emoji }.to_json}
        res = Net::HTTP.post_form(URI.parse("#{slack_api_root}/users.profile.set?token=#{token}"), profile)
        json_response(res.code)
      end

      def json_response(object, code = :ok)
        render json: object, code: code
      end
    end
  end
end