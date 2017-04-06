describe "restaurant" do

  it "has many restaurants" do
    user = User.create(email: 'test@test.com', password: 'makers', password_confirmation: 'makers')
    expect(user).to have_many(:restaurants)
  end

  it "has many reviews" do
    user = User.create(email: 'test@test.com', password: 'makers', password_confirmation: 'makers')
    expect(user).to have_many(:reviews)
  end

end
