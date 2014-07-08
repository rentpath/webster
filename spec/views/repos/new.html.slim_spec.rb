require 'spec_helper'

describe "repos/new" do
  before(:each) do
    assign(:repo, stub_model(Repo,
      :name => "MyString",
      :organization => "MyString",
      :full_name => "MyString",
      :public => false
    ).as_new_record)
  end

  it "renders new repo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", repos_path, "post" do
      assert_select "input#repo_name[name=?]", "repo[name]"
      assert_select "input#repo_organization[name=?]", "repo[organization]"
      assert_select "input#repo_full_name[name=?]", "repo[full_name]"
      assert_select "input#repo_public[name=?]", "repo[public]"
    end
  end
end
