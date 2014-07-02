require 'rails_helper'

RSpec.describe "applications/new", :type => :view do
  before(:each) do
    assign(:application, Application.new(
      :name => "MyString",
      :description => "MyText",
      :host_group => "MyText",
      :metadata => ""
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do

      assert_select "input#application_name[name=?]", "application[name]"

      assert_select "textarea#application_description[name=?]", "application[description]"

      assert_select "textarea#application_host_group[name=?]", "application[host_group]"

      assert_select "input#application_metadata[name=?]", "application[metadata]"
    end
  end
end
