require 'rails_helper'

RSpec.describe "applications/index", :type => :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :name => "Name",
        :description => "MyText",
        :host_group => "MyText",
        :metadata => ""
      ),
      Application.create!(
        :name => "Name",
        :description => "MyText",
        :host_group => "MyText",
        :metadata => ""
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
