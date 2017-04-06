describe "restaurant" do
  it "is invalid for a restaurant name of less than three letters" do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
