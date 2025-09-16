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
class ListItem < ApplicationRecord
  belongs_to :list

  validates :name, presence: true
end
