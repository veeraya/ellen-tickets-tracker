require 'spec_helper'

describe "trackings/show" do
  before(:each) do
    @tracking = assign(:tracking, stub_model(Tracking))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
