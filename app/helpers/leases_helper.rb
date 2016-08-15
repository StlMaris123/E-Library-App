module LeasesHelper
  def remaining_days(lease)
    if lease.due_date.future?
      unless lease.due_date.nil?
        distance_of_time_in_words( Time.zone.now, lease.due_date)
      end
    end
  end

  # def charge_fee(lease)
  #   if lease.due_date < 0
  #     lease.due_date *= 50
  #   else
  #     lease.charges==nil

  #   end
  # end
end

