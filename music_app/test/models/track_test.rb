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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
