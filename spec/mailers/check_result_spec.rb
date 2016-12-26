require "rails_helper"

RSpec.describe CheckResultMailer, type: :mailer do
  describe "report" do
    let(:mail) { CheckResultMailer.report }

    it "renders the headers" do
      expect(mail.subject).to eq("Report")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
