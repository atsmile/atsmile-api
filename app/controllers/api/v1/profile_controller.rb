module Api
  module V1
    class ProfileController < ApplicationController
      def show
        profile = Profile.first
        render json: profile.as_json(except: [ :id, :created_at, :updated_at ])
      end
    end
  end
end
