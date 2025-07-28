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
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
