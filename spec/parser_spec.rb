# frozen_string_literal: true

RSpec.describe SeeYouCup::Parser do
  it 'raises no error for existing file' do
    expect { SeeYouCup::Parser.new("#{__dir__}/samples/lotnik.cup") }.not_to raise_error
  end

  it 'raises FileNotFound error for missing file' do
    expect { SeeYouCup::Parser.new('/no/such/file') }.to raise_error SeeYouCup::FileNotFound
  end

  describe '#parse' do
    before { @result = SeeYouCup::Parser.new("#{__dir__}/samples/basic.cup").parse }

    it 'returns three waypoints' do
      expect(@result.count).to eq 3
    end
  end

  describe '#parse pro' do
    before { @result = SeeYouCup::Parser.new("#{__dir__}/samples/lotnik.cup").parse }

    it 'correctly parses file to the last line' do
      expect(@result.last.desc).to eq 'Asphalt-concrete, 1050x30m, 96°-276°'
    end
  end
end
