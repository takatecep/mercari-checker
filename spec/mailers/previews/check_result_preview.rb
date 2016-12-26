# Preview all emails at http://localhost:3000/rails/mailers/check_result
class CheckResultPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/check_result/report
  def report
    CheckResultMailer.report
  end

end
