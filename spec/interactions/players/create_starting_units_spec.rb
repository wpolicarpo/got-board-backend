require "rails_helper"

describe CreateStartingUnits, type: :interactions do
  let(:ships_areas) { subject.boats.map(&:territory) }
  let(:knights_areas) { subject.knights.map(&:territory) }
  let(:footmen_areas) { subject.footmen.map(&:territory) }

  subject { described_class.run!(player: player) }

  context "with House of Baratheon" do
    let(:player) { create(:player, :baratheon) }

    it "creates 2 Ships in Shipbreaker Bay" do
      expect(ships_areas).to match_array %w(shipbreaker_bay shipbreaker_bay)
    end

    it "creates 1 Knight in Dragonstone" do
      expect(knights_areas).to match_array %w(dragonstone)
    end

    it "creates 2 Footmen each in Dragonstone and Kingswood" do
      expect(footmen_areas).to match_array %w(dragonstone kingswood)
    end
  end

  context "with House of Lannister" do
    let(:player) { create(:player, :lannister) }

    it "creates 1 Ship in The Golden Sound" do
      expect(ships_areas).to match_array %w(the_golden_sound)
    end

    it "creates 1 Knights in Lannisport" do
      expect(knights_areas).to match_array %w(lannisport)
    end

    it "creates 2 Footmen each in Lannisport and Stoney Sept" do
      expect(footmen_areas).to match_array %w(lannisport stoney_sept)
    end
  end

  context "with House of Stark" do
    let(:player) { create(:player, :stark) }

    it "creates 1 Ship in The Shivering Sea" do
      expect(ships_areas).to match_array %w(the_shivering_sea)
    end

    it "creates 1 Knights in Winterfell" do
      expect(knights_areas).to match_array %w(winterfell)
    end

    it "creates 2 Footmen each in Winterfell and White Harbor" do
      expect(footmen_areas).to match_array %w(winterfell white_harbor)
    end
  end

  context "with House of Greyjoy" do
    let(:player) { create(:player, :greyjoy) }

    it "creates 2 Boat each in Ironman's Bay and Port of Pyke" do
      expect(ships_areas).to match_array %w(ironmans_bay port_of_pyke)
    end

    it "creates 1 Knight in Pyke" do
      expect(knights_areas).to match_array %w(pyke)
    end

    it "creates 2 Footman each in Pyke and Greywater Watch" do
      expect(footmen_areas).to match_array %w(pyke greywater_watch)
    end
  end

  context "with House of Tyrell" do
    let(:player) { create(:player, :tyrell) }

    it "creates 1 Ship in Redwyne Straights" do
      expect(ships_areas).to match_array %w(redwyne_straights)
    end

    it "creates 1 Knight in Highgarden" do
      expect(knights_areas).to match_array %w(highgarden)
    end

    it "creates 2 Footmen each in Highgarden and Dornish Marches" do
      expect(footmen_areas).to match_array %w(highgarden dornish_marches)
    end
  end

  context "with House of Martell" do
    let(:player) { create(:player, :martell) }

    it "creates 1 Ship Sea of Dorne" do
      expect(ships_areas).to match_array %w(sea_of_dorne)
    end

    it "creates 1 Knight in Sunspear" do
      expect(knights_areas).to match_array %w(sunspear)
    end

    it "creates 2 Footmen each in Sunspear and Salt Shore" do
      expect(footmen_areas).to match_array %w(sunspear salt_shore)
    end
  end
end
