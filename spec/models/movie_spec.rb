require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it { should have_many(:cast_members).dependent(:destroy) }
    it { should have_many(:actors).through(:cast_members) }
  end
end
