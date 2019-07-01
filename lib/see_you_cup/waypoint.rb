# frozen_string_literal: true

module SeeYouCup
  class Waypoint
    STYLE_MAP = {
      0 => 'Unknown',
      1 => 'Waypoint',
      2 => 'Airfield with grass surface runway',
      3 => 'Outlanding',
      4 => 'Gliding airfield',
      5 => 'Airfield with solid surface runway',
      6 => 'Mountain Pass',
      7 => 'Mountain Top',
      8 => 'Transmitter Mast',
      9 => 'VOR',
      10 => 'NDB',
      11 => 'Cooling Tower',
      12 => 'Dam',
      13 => 'Tunnel',
      14 => 'Bridge',
      15 => 'Power Plant',
      16 => 'Castle',
      17 => 'Intersection'
    }.freeze

    attr_accessor :name, :code, :country, :elev, :rwydir, :rwylen, :freq, :desc
    attr_reader :lat, :lon

    def lon=(coord)
      @lon = parse_coord(coord)
    end

    def lat=(coord)
      @lat = parse_coord(coord)
    end

    def style=(style)
      @style = style.to_i
    end

    def style
      STYLE_MAP[@style]
    end

    private

    def parse_coord(coord)
      return coord if coord.is_a?(Float)

      coord = coord.upcase.strip.gsub(/^0/, '')
      sign = %w[N E].include?(coord[-1]) ? 1 : -1
      coord.chop!
      deg = coord[0..1].to_f
      min = coord[2..7].to_f
      sign * (deg + min / 60)
    end
  end
end
