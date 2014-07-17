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
  before_validation :coerce_payload
  serialize :payload

  private

  def default_coercion
    ->(payload){ JSON.parse(payload, symbolize_names: true)}
  end

  def coerce_payload(fn = default_coercion)
    payload = self.payload
    if payload.class == String
      self.payload = fn.call(payload)
    end
  end
end
