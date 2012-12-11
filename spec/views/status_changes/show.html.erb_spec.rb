require 'spec_helper'

describe "status_changes/show" do
  before(:each) do
    @status_change = assign(:status_change, stub_model(StatusChange,
      :from_status => "From Status",
      :to_status => "To Status",
      :ticket_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/From Status/)
    rendered.should match(/To Status/)
    rendered.should match(//)
  end
end
