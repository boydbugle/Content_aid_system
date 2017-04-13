# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
    validates :tag, presence: true
end
