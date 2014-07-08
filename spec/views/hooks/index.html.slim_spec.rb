require 'spec_helper'

describe "hooks/index" do
  before(:each) do
    assign(:hooks, [
      stub_model(Hook,
        :name => "Name",
        :payload => "MyText"
      ),
      stub_model(Hook,
        :name => "Name",
        :payload => "MyText"
      )
    ])
  end

  it "renders a list of hooks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
