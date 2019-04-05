# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  ord        :integer
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           default("(Untitled)"), not null
#  bonus      :boolean          default(FALSE)
#

class Track < ApplicationRecord
    validates :album_id, presence: true

    belongs_to :album,
        foreign_key: :album_id,
        class_name: :Album

    has_one :band,
        through: :album,
        source: :band

    def bonus?
        bonus
    end
end
