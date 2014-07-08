require 'rails_helper'

RSpec.describe "apps/new", :type => :view do
  before(:each) do
    assign(:app, App.new(
      :name => "MyString",
      :description => "MyText",
      :host_group => "MyText",
      :metadata => ""
    ))
  end

  it "renders new app form" do
    render

    assert_select "form[action=?][method=?]", apps_path, "post" do

      assert_select "input#app_name[name=?]", "app[name]"

      assert_select "textarea#app_description[name=?]", "app[description]"

      assert_select "textarea#app_host_group[name=?]", "app[host_group]"

      assert_select "input#app_metadata[name=?]", "app[metadata]"
    end
  end
end
