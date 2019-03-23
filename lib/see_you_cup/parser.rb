# frozen_string_literal: true

require 'stringio'

module SeeYouCup
  class Parser
    def initialize(path)
      raise FileNotFound unless File.exist?(path)

      @buffer = StringIO.new(load_file(path), 'r')
    end

    def parse
      res = []
      res << read_waypoint(@buffer) until @buffer.eof?
      res
    end

    private

    def read_waypoint(buffer)
      # :name, :code, :country, :lat, :lon, :elev, :style, :rwydir, :rwylen, :freq, :desc
      wp = Waypoint.new
      wp.name = read_field(buffer)
      wp.code = read_field(buffer)
      wp.country = read_field(buffer)
      wp.lat = read_field(buffer)
      wp.lon = read_field(buffer)
      wp.elev = read_field(buffer)
      wp.style = read_field(buffer)
      wp.rwydir = read_field(buffer)
      wp.rwylen = read_field(buffer)
      wp.freq = read_field(buffer)
      wp.desc = read_field(buffer)
      wp
    end

    def read_field(buffer)
      ret = String.new
      quote_open = false
      while (char = buffer.getc)
        break if char == ',' && !quote_open
        break if char == "\n" && !quote_open

        if char == '"'
          quote_open = !quote_open
        else
          ret << char
        end
      end
      ret
    end

    def load_file(path)
      str = File.readlines(path).map(&:chomp)
      # remove first line (column headers)
      str.shift
      # standardize line separator (in case \r was used before)
      str.join("\n")
    end
  end
end
