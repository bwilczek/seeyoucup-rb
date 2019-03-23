# frozen_string_literal: true

RSpec.describe SeeYouCup::Parser do
  it 'raises no error for existing file' do
    expect { SeeYouCup::Parser.new("#{__dir__}/samples/lotnik.cup") }.not_to raise_error
  end
end
