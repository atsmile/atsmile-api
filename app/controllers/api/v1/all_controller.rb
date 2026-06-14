module Api
  module V1
    class AllController < ApplicationController
      def show
        profile = Profile.first

        careers = Career.all

        skill_groups = SkillGroup.includes(:skills).order(:position)

        works = Work.includes(:work_tags).order(:position)

        render json: {
          profile: profile.as_json(except: [:id, :created_at, :updated_at]),
          profileAnon: profile.as_json(except: [:id, :created_at, :updated_at]).merge(
            "name" => "atsmile",
            "github" => ""
          ),
          aboutCards: [
            {
              title: "Profile",
              body: "#{profile.location}のフロントエンドエンジニア。\n#{profile.hobby}"
            },
            {
              title: "Experience",
              body: "#{profile.experience}。\nテストエンジニア出身で品質への意識が強みです。"
            },
            {
              title: "Specialty",
              body: "React / Next.js を中心にフロントエンドの実装を担当。\nバックエンドも多少触れます。"
            },
            {
              title: "Now",
              body: profile.now
            }
          ],
          careers: careers.as_json(except: [:id, :created_at, :updated_at]),
          skillGroups: skill_groups.as_json(
            only: [:label],
            include: { skills: { only: [:name, :level] } }
          ),
          works: works.map { |work|
            json = work.as_json(except: [:id, :created_at, :updated_at, :position, :basic_auth_user, :basic_auth_password])
            json["id"] = work.slug
            json.delete("slug")
            json["tags"] = work.work_tags.map(&:name)
            if work.basic_auth_user.present?
              json["basicAuth"] = { user: work.basic_auth_user, password: work.basic_auth_password }
            end
            json
          }
        }
      end
    end
  end
end
