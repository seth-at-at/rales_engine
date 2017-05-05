require 'rails_helper'

describe Customer do
  describe "relationships" do
    it { is_expected.to have_many(:invoices) }
    it { is_expected.to have_many(:transactions) }
  end
end
