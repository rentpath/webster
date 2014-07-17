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

require 'spec_helper'

RSpec.describe App, :type => :model do
  skip "add some examples to (or delete) #{__FILE__}"
end
