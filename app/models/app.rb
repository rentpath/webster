# == Schema Information
#
# Table name: apps
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  host_group   :text
#  metadata     :text
#  created_at   :datetime
#  updated_at   :datetime
#  wiki_path    :string(255)
#  primary_team :string(255)
#

class App < ActiveRecord::Base
  has_one :repo, dependent: :destroy
  serialize :metadata
  # Metadata should be json
end
