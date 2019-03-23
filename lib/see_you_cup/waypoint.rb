# frozen_string_literal: true

module SeeYouCup
  Waypoint = Struct.new(:name, :code, :country, :lat, :lon, :elev, :style, :rwydir, :rwylen, :freq, :desc, keyword_init: true) # rubocop:disable Metrics/LineLength
end
