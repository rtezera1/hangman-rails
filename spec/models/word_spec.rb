require 'spec_helper'

describe Word do

  it { should have_valid(:content).when('mike') }
  it { should_not have_valid(:content).when(nil, "", '121') }

end
