module Api
  module V1
    class WorksController < ApplicationController
      def index
        works = Work.includes(:work_tags).order(:position)
        render json: works.map { |work|
          json = work.as_json(except: [ :id, :created_at, :updated_at, :position, :basic_auth_user, :basic_auth_password ])
          json["id"] = work.slug
          json.delete("slug")
          json["tags"] = work.work_tags.map(&:name)
          if work.basic_auth_user.present?
            json["basicAuth"] = { user: work.basic_auth_user, password: work.basic_auth_password }
          end
          json
        }
      end
    end
  end
end
