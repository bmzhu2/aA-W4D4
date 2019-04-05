# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer
#  band_id    :integer          not null
#  live       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    validates :title, :band_id, presence: true
    
    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band

    has_many :tracks,
        foreign_key: :album_id,
        class_name: :Track,
        dependent: :destroy

    def band=(name)
        @band = name
        self.band_id = Band.find_by(name: @band).id
    end

    def live_or_studio
        self.live ? "live" : "studio"
    end
end
