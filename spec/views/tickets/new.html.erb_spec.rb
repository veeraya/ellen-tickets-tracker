require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path, :method => "post" do
      assert_select "input#ticket_status", :name => "ticket[status]"
    end
  end
end
