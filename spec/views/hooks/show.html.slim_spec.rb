require 'spec_helper'

describe "hooks/show" do
  before(:each) do
    @hook = assign(:hook, stub_model(Hook,
      :name => "Name",
      :payload => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
