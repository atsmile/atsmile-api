require "rails_helper"

RSpec.describe SkillGroup, type: :model do
  describe "バリデーション" do
    it "labelがあれば有効であること" do
      skill_group = SkillGroup.new(label: "Frontend")
      expect(skill_group).to be_valid
    end

    it "labelがなければ無効であること" do
      skill_group = SkillGroup.new(label: nil)
      expect(skill_group).to be_invalid
    end
  end

  describe "アソシエーション" do
    it "skill_groupを削除すると関連するskillsも削除されること" do
      skill_group = create(:skill_group)
      create(:skill, skill_group: skill_group)

      expect { skill_group.destroy }.to change(Skill, :count).by(-1)
    end
  end
end