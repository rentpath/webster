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
#  app_id       :integer
#

require 'spec_helper'

describe Repo do
  pending "add some examples to (or delete) #{__FILE__}"
end
