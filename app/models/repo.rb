# == Schema Information
#
# Table name: repos
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  organization :string(255)
#  full_name    :string(255)
#  public       :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

class Repo < ActiveRecord::Base
  belongs_to :app
  has_many :hooks
end
