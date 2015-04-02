require 'rails_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number}
  it { should validate_length_of(:number).is_equal_to(10) }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }
  it { should have_many :contacts}
  it { should have_many :messages}
end
