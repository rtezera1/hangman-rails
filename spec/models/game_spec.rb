require 'spec_helper'

describe Game do
  it { should belong_to :user }
  it {should belong_to :word}
end
