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
  has_many :hooks, through: :repo
  before_validation :coerce_metadata
  serialize :metadata

  private

  def default_coercion
    ->(json){ JSON.parse(json, symbolize_names: true)}
  end

  def coerce_metadata(fn = default_coercion)
    metadata = self.metadata
    if metadata.class == String
      self.metadata = fn.call(metadata)
    end
  end
end
