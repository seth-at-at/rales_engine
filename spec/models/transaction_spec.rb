require 'rails_helper'

describe Transaction do
  describe "relationships" do
    it { is_expected.to belong_to(:invoice) }
  end
end
