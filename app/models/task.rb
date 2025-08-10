# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  duration    :float
#  due_on      :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  priority    :integer          default("normal")
#  status      :integer          default("open")
#  color       :string           default("#ffffff")
#  category_id :bigint
#
class Task < ApplicationRecord
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :status, inclusion: { in: %w(open in_progress done) }
  validates :priority, inclusion: { in: %w(very_low low normal medium high very_high, critical) }

  enum status: { open: 0, in_progress: 1, done: 2 }
  enum priority: { very_low: 0, low: 1, normal: 2, medium: 3, high: 4, very_high: 5, critical: 6 }

  class << self
    def categories
      Category.all.pluck(:name).uniq.sort
    end
  end
end
