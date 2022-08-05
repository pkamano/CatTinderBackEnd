require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do
    cat = Cat.create(age: 2, enjoys: 'Basking in the sun', image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80')
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
      cat = Cat.create(name: 'Billy', enjoys: 'Basking in the sun', image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80')
      expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create(name: 'Billy', age: 2, image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
  cat = Cat.create(name: 'Billy', enjoys: 'Basking in the sun', age: 2)
  expect(cat.errors[:image]).to_not be_empty
  end

  it 'enjoys must have minimum length of ten' do
  cat = Cat.create(
    name: 'Billy',
    age: 2,
    enjoys: 'Baski',
    image:'https://image.shutterstock.com/image-photo/cute-cat-lying-on-his-260nw-572338033.jpg'
  )
  expect(cat.errors[:enjoys].first).to eq("is too short (minimum is 10 characters)")
  end
end
