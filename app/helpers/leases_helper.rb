module LeasesHelper
  def remaining_days(lease)
    if lease.due_date.future?
      unless lease.due_date.nil?
        distance_of_time_in_words( Time.zone.now, lease.due_date)
      end
    end
  end
  # def overdue?
  #   due_date_absolute < Time.now.strftime("%d %B %Y") && self.active == true
  # end

  # def overdue_rate
  #   50.0
  # end

  # def due_date_absolute
  #       self.booking_end.strftime("%d %B %Y")
  # end

  # def fine
  #   overdue_rate * ((Time.zone.now - over_due_date)/1.days)
  # end

end

