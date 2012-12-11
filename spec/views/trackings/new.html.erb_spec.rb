require 'spec_helper'

describe "trackings/new" do
  before(:each) do
    assign(:tracking, stub_model(Tracking).as_new_record)
  end

  it "renders new tracking form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trackings_path, :method => "post" do
    end
  end
end
