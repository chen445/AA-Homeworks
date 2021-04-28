# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  live       :boolean          not null
#  name       :string           not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer          not null
#
# Indexes
#
#  index_albums_on_band_id  (band_id)
#
class Album < ApplicationRecord
    validates :name, :year, presence: true
    validates :live, inclusion: {in: [true, false]}
    belongs_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band
end
