require 'spec_helper'

describe "repos/index" do
  before(:each) do
    assign(:repos, [
      stub_model(Repo,
        :name => "Name",
        :organization => "Organization",
        :full_name => "Full Name",
        :public => false
      ),
      stub_model(Repo,
        :name => "Name",
        :organization => "Organization",
        :full_name => "Full Name",
        :public => false
      )
    ])
  end

  it "renders a list of repos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
