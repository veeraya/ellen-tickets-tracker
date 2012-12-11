require 'spec_helper'

describe "trackings/edit" do
  before(:each) do
    @tracking = assign(:tracking, stub_model(Tracking))
  end

  it "renders the edit tracking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trackings_path(@tracking), :method => "post" do
    end
  end
end
