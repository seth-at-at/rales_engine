require 'rails_helper'

describe Invoice do
  describe "relationships" do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:merchant) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:invoice_items) }
    it { is_expected.to have_many(:transactions) }
  end
end
