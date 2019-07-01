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
      wp.name = read_quoted_field(buffer)
      wp.code = read_quoted_field(buffer)
      wp.country = read_simple_field(buffer)
      wp.lat = read_simple_field(buffer)
      wp.lon = read_simple_field(buffer)
      wp.elev = read_simple_field(buffer)
      wp.style = read_simple_field(buffer)
      wp.rwydir = read_simple_field(buffer)
      wp.rwylen = read_simple_field(buffer)
      wp.freq = read_simple_field(buffer)
      wp.desc = read_quoted_field(buffer)
      wp
    end

    def read_simple_field(buffer)
      ret = String.new
      while (char = buffer.getc)
        break if char == ','

        raise 'quote not allowed' if char == '"'

        ret << char
      end
      ret
    end

    def read_quoted_field(buffer)
      ret = String.new
      quote_open = false
      first = false
      while (char = buffer.getc)
        raise 'quote expected' if first && char != '"'

        first = false
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
