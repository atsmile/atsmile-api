module Api
  module V1
    class SkillsController < ApplicationController
      def index
        skill_groups = SkillGroup.includes(:skills).order(:position)
        render json: skill_groups.as_json(
          only: [:label],
          include: {
            skills: {
              only: [:name, :level]
            }
          }
        )
      end
    end
  end
end
