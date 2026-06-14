module Api
  module V1
    class CareersController < ApplicationController
      def index
        careers = Career.all
        render json: careers.as_json(except: [ :id, :created_at, :updated_at ])
      end
    end
  end
end
