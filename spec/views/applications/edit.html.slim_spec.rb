require 'rails_helper'

RSpec.describe "apps/edit", :type => :view do
  before(:each) do
    @app = assign(:app, App.create!(
      :name => "MyString",
      :description => "MyText",
      :host_group => "MyText",
      :metadata => ""
    ))
  end

  it "renders the edit app form" do
    render

    assert_select "form[action=?][method=?]", app_path(@app), "post" do

      assert_select "input#app_name[name=?]", "app[name]"

      assert_select "textarea#app_description[name=?]", "app[description]"

      assert_select "textarea#app_host_group[name=?]", "app[host_group]"

      assert_select "input#app_metadata[name=?]", "app[metadata]"
    end
  end
end
