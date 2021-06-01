require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :cast_members }
  end
end