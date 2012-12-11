require 'spec_helper'

describe "trackings/index" do
  before(:each) do
    assign(:trackings, [
      stub_model(Tracking),
      stub_model(Tracking)
    ])
  end

  it "renders a list of trackings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
