require 'rails_helper'

RSpec.describe "apps/index", :type => :view do
  before(:each) do
    assign(:apps, [
      App.create!(
        :name => "Name",
        :description => "MyText",
        :host_group => "MyText",
        :metadata => ""
      ),
      App.create!(
        :name => "Name",
        :description => "MyText",
        :host_group => "MyText",
        :metadata => ""
      )
    ])
  end

  it "renders a list of apps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
