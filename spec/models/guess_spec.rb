require 'spec_helper'

describe Guess do
  it { should belong_to :user }
  it { should belong_to :game }
  pending "add some examples to (or delete) #{__FILE__}"
end
