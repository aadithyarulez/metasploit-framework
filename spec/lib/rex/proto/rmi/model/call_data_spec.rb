# -*- coding:binary -*-
require 'spec_helper'

require 'stringio'
require 'rex/proto/rmi'
require 'rex/java'

RSpec.describe Rex::Proto::Rmi::Model::CallData do

  subject(:call_data) do
    described_class.new
  end

  let(:call_data_stream) do
    "\xac\xed\x00\x05\x77\x22\x00\x00\x00\x00\x00\x00\x00\x02\x00" +
    "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" +
    "\x01\xf6\xb6\x89\x8d\x8b\xf2\x86\x43\x75\x72\x00\x18\x5b\x4c\x6a" +
    "\x61\x76\x61\x2e\x72\x6d\x69\x2e\x73\x65\x72\x76\x65\x72\x2e\x4f" +
    "\x62\x6a\x49\x44\x3b\x87\x13\x00\xb8\xd0\x2c\x64\x7e\x02\x00\x00" +
    "\x70\x78\x70\x00\x00\x00\x01\x73\x72\x00\x15\x6a\x61\x76\x61\x2e" +
    "\x72\x6d\x69\x2e\x73\x65\x72\x76\x65\x72\x2e\x4f\x62\x6a\x49\x44" +
    "\xa7\x5e\xfa\x12\x8d\xdc\xe5\x5c\x02\x00\x02\x4a\x00\x06\x6f\x62" +
    "\x6a\x4e\x75\x6d\x4c\x00\x05\x73\x70\x61\x63\x65\x74\x00\x15\x4c" +
    "\x6a\x61\x76\x61\x2f\x72\x6d\x69\x2f\x73\x65\x72\x76\x65\x72\x2f" +
    "\x55\x49\x44\x3b\x70\x78\x70\xbf\x26\x22\xcc\x85\x10\xe0\xf0\x73" +
    "\x72\x00\x13\x6a\x61\x76\x61\x2e\x72\x6d\x69\x2e\x73\x65\x72\x76" +
    "\x65\x72\x2e\x55\x49\x44\x0f\x12\x70\x0d\xbf\x36\x4f\x12\x02\x00" +
    "\x03\x53\x00\x05\x63\x6f\x75\x6e\x74\x4a\x00\x04\x74\x69\x6d\x65" +
    "\x49\x00\x06\x75\x6e\x69\x71\x75\x65\x70\x78\x70\x80\x01\x00\x00" +
    "\x01\x49\xb5\xe4\x92\x78\xd2\x4f\xdf\x47\x77\x08\x80\x00\x00\x00" +
    "\x00\x00\x00\x00\x73\x72\x00\x12\x6a\x61\x76\x61\x2e\x72\x6d\x69" +
    "\x2e\x64\x67\x63\x2e\x4c\x65\x61\x73\x65\xb0\xb5\xe2\x66\x0c\x4a" +
    "\xdc\x34\x02\x00\x02\x4a\x00\x05\x76\x61\x6c\x75\x65\x4c\x00\x04" +
    "\x76\x6d\x69\x64\x74\x00\x13\x4c\x6a\x61\x76\x61\x2f\x72\x6d\x69" +
    "\x2f\x64\x67\x63\x2f\x56\x4d\x49\x44\x3b\x70\x78\x70\x00\x00\x00" +
    "\x00\x00\x09\x27\xc0\x73\x72\x00\x11\x6a\x61\x76\x61\x2e\x72\x6d" +
    "\x69\x2e\x64\x67\x63\x2e\x56\x4d\x49\x44\xf8\x86\x5b\xaf\xa4\xa5" +
    "\x6d\xb6\x02\x00\x02\x5b\x00\x04\x61\x64\x64\x72\x74\x00\x02\x5b" +
    "\x42\x4c\x00\x03\x75\x69\x64\x71\x00\x7e\x00\x03\x70\x78\x70\x75" +
    "\x72\x00\x02\x5b\x42\xac\xf3\x17\xf8\x06\x08\x54\xe0\x02\x00\x00" +
    "\x70\x78\x70\x00\x00\x00\x08\x6b\x02\xc7\x72\x60\x1c\xc7\x95\x73" +
    "\x71\x00\x7e\x00\x05\x80\x01\x00\x00\x01\x49\xb5\xf8\x00\xea\xe9" +
    "\x62\xc1\xc0"
  end

  let(:call_data_stream_io) { StringIO.new(call_data_stream) }

  describe "#decode" do
    it "returns the Rex::Proto::Rmi::Model::CallData decoded" do
      expect(call_data.decode(call_data_stream_io)).to eq(call_data)
    end

    it "decodes code correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.object_number).to eq(2)
    end

    it "decodes the uid correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.uid).to be_a(Rex::Proto::Rmi::Model::UniqueIdentifier)
    end

    it "decodes the operation correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.operation).to eq(1)
    end

    it "decodes the hash correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.hash).to eq(-669196253586618813)
    end

    it "decodes the arguments correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.arguments).to be_an(Array)
    end

    it "decodes all the arguments" do
      call_data.decode(call_data_stream_io)
      expect(call_data.arguments.length).to eq(3)
    end

    it "decodes the first argument as an array" do
      call_data.decode(call_data_stream_io)
      expect(call_data.arguments[0]).to be_an(Rex::Java::Serialization::Model::NewArray)
    end

    it "decodes the type of the first argument array correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.arguments[0].array_description.description.class_name.contents).to eq('[Ljava.rmi.server.ObjID;')
    end
  end

  describe "#encode" do
    it "re-encodes a CallData stream correctly" do
      call_data.decode(call_data_stream_io)
      expect(call_data.encode).to eq(call_data_stream)
    end
  end
end
