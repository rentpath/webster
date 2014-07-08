# == Schema Information
#
# Table name: hooks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  payload    :text
#  created_at :datetime
#  updated_at :datetime
#  repo_id    :integer
#

class Hook < ActiveRecord::Base
  belongs_to :repo
end
