require 'spec_helper'

describe "status_changes/edit" do
  before(:each) do
    @status_change = assign(:status_change, stub_model(StatusChange,
      :from_status => "MyString",
      :to_status => "MyString",
      :ticket_id => ""
    ))
  end

  it "renders the edit status_change form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => status_changes_path(@status_change), :method => "post" do
      assert_select "input#status_change_from_status", :name => "status_change[from_status]"
      assert_select "input#status_change_to_status", :name => "status_change[to_status]"
      assert_select "input#status_change_ticket_id", :name => "status_change[ticket_id]"
    end
  end
end
