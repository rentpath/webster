require 'spec_helper'

describe "hooks/new" do
  before(:each) do
    assign(:hook, stub_model(Hook,
      :name => "MyString",
      :payload => "MyText"
    ).as_new_record)
  end

  it "renders new hook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hooks_path, "post" do
      assert_select "input#hook_name[name=?]", "hook[name]"
      assert_select "textarea#hook_payload[name=?]", "hook[payload]"
    end
  end
end
