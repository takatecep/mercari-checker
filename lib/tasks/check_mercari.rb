module Tasks
  class CheckMercari
    def self.execute
      CheckItem.all.each do |item|
        result = item.check
        CheckResultMailer.report(item, result).deliver
      end
    end
  end
end
