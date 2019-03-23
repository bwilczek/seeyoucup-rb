# frozen_string_literal: true

module SeeYouCup
  class Parser
    def initialize(path)
      # TODO: introduce proper exception type
      raise unless File.exist?(path)
    end
  end
end
