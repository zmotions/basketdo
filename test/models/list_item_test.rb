# == Schema Information
#
# Table name: list_items
#
#  id         :bigint           not null, primary key
#  name       :string
#  done       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :bigint
#
require "test_helper"

class ListItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
