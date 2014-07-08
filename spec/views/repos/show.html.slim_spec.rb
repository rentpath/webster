require 'spec_helper'

describe "repos/show" do
  before(:each) do
    @repo = assign(:repo, stub_model(Repo,
      :name => "Name",
      :organization => "Organization",
      :full_name => "Full Name",
      :public => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Organization/)
    rendered.should match(/Full Name/)
    rendered.should match(/false/)
  end
end
