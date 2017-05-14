require "spec_helper"

RSpec.describe SptransApi do
  it "has a version number" do
    expect(SptransApi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe "POST test authorize" do
    it "Api response == 200" do
      instance = SptransApi::Call.new("68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed")
      expect(instance.authenticate_with_api.parsed_response).to eq(true)
    end
  end

  describe "POST test not authorized" do
    it "Api response == 200" do
      instance = SptransApi::Call.new("68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968edd")
      expect(instance.authenticate_with_api.parsed_response).to eq(false)
    end
  end

  describe "GET to_search lines" do
    it "Api response == 200" do
      instance = SptransApi::Call.new("68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed")
      response = instance.to_search_lines(9000)
      raise response.inspect
      expect(response["code"]).to eq(200)
    end
  end

  describe "GET stop_search" do
    it "Api response == 200" do
      instance = SptransApi::Call.new("68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed")
      response = instance.stop_search(9000)
      raise response.inspect
      expect(response["code"]).to eq(200)
    end
  end
end
