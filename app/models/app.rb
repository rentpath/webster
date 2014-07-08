# == Schema Information
#
# Table name: apps
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  host_group  :text
#  metadata    :text
#  created_at  :datetime
#  updated_at  :datetime
#

class App < ActiveRecord::Base
  serialize :metadata
  # Metadata should be json
end
