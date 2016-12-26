class CheckResultMailer < ApplicationMailer
  def report(item, result)
    @result = result
    @item = item

    mail to: item.user.email, subject: "#{item.name} チェック結果"
  end
end
