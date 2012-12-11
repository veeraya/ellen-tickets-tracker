require 'spec_helper'

describe "status_changes/new" do
  before(:each) do
    assign(:status_change, stub_model(StatusChange,
      :from_status => "MyString",
      :to_status => "MyString",
      :ticket_id => ""
    ).as_new_record)
  end

  it "renders new status_change form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => status_changes_path, :method => "post" do
      assert_select "input#status_change_from_status", :name => "status_change[from_status]"
      assert_select "input#status_change_to_status", :name => "status_change[to_status]"
      assert_select "input#status_change_ticket_id", :name => "status_change[ticket_id]"
    end
  end
end
