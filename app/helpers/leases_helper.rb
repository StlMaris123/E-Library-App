module LeasesHelper
  def remaining_days(lease)
    if lease.due_date.future?
      unless lease.due_date.nil?
        distance_of_time_in_words( Time.zone.now, lease.due_date)
      end
    end
  end
end
