require 'rails_helper'

describe InvoiceItem do
  describe "relationships" do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:invoice) }
    it { is_expected.to have_many(:transactions) }
  end
end
