require 'rails_helper'

describe Merchant do
  describe "relationships" do
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:invoice_items) }
    it { is_expected.to have_many(:invoices) }
  end
end
