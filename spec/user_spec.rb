require 'spec_helper'

describe User do
  it "should have leaders and minions" do
    lynne = User.create!
    lawrence = User.create!
    joyce = User.create!
    ginny = User.create!
    jared = User.create!
    brick = User.create!
    # lynne.minion_followings.create!()
    # Follow.create!(leader: lynne, minion: lawrence)
    lynne.minions << lawrence
    lynne.minions << ginny
    lynne.minions << brick
    lynne.save!
    lynne.reload
    expect(lynne.minions).to include lawrence
    expect(lynne.minions).to include ginny
    expect(lynne.minions).to include brick
    expect(lawrence.leaders).to include lynne
    expect(ginny.leaders).to include lynne
    expect(brick.leaders).to include lynne
  end
end