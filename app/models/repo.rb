class Repo < ActiveRecord::Base
  belongs_to :app
  has_many :hooks
end
