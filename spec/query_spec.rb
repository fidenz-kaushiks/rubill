require "spec_helper"

module Rubill
  describe Query do
    let(:options) { {"a" => "b"} }

    describe ".execute" do
      let(:url) { "url" }

      it "instantiates a new query and executes it" do
        instance = double(execute: true)
        expect(described_class).to receive(:new).with(url, options) { instance }
        expect(instance).to receive(:execute)
        described_class.execute(url, options)
      end
    end

    describe "#execute" do
      subject { described_class.new("url", {}) }

      it "delegates to the Session instance" do
        instance = double(execute: true)
        allow(Session).to receive(:instance) { instance }
        expect(instance).to receive(:execute).with(subject)
        subject.execute
      end
    end

    describe ".execute" do
      let(:url) { "url" }
      let(:query) { double(execute: true) }

      it "creates a new Query object and executes it" do
        expect(described_class).to receive(:new).with(url, options) { query }
        expect(query).to receive(:execute)
        described_class.execute(url, options)
      end
    end

    describe ".pay_bills" do
      let(:url) { "/PayBills.json" }
      let(:query) { double(execute: true) }

      it "creates a new Query object and executes it" do
        expect(described_class).to receive(:new).with(url, options) { query }
        expect(query).to receive(:execute)
        described_class.pay_bills(options)
      end
    end

    describe ".send_vendor_invite" do
      let(:url) { "/SendVendorInvite.json" }
      let(:query) { double(execute: true) }
      let(:vendor_id) { '1234' }
      let(:email) { 'test@email.com' }
      let(:options) { Hash[vendorId: '1234', email: 'test@email.com'] }

      it "creates a new Query object and executes it" do
        expect(described_class).to receive(:new).with(url, options) { query }
        expect(query).to receive(:execute)
        described_class.send_vendor_invite(vendor_id, email)
      end
    end
  end
end
