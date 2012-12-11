require 'spec_helper'

describe "status_changes/index" do
  before(:each) do
    assign(:status_changes, [
      stub_model(StatusChange,
        :from_status => "From Status",
        :to_status => "To Status",
        :ticket_id => ""
      ),
      stub_model(StatusChange,
        :from_status => "From Status",
        :to_status => "To Status",
        :ticket_id => ""
      )
    ])
  end

  it "renders a list of status_changes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "From Status".to_s, :count => 2
    assert_select "tr>td", :text => "To Status".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
