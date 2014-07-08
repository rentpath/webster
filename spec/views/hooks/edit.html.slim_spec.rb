require 'spec_helper'

describe "hooks/edit" do
  before(:each) do
    @hook = assign(:hook, stub_model(Hook,
      :name => "MyString",
      :payload => "MyText"
    ))
  end

  it "renders the edit hook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hook_path(@hook), "post" do
      assert_select "input#hook_name[name=?]", "hook[name]"
      assert_select "textarea#hook_payload[name=?]", "hook[payload]"
    end
  end
end
