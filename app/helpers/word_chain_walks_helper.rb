module WordChainWalksHelper
  def formatted_elapsed_time(seconds)
    hours = seconds / 3600
    minutes = (seconds % 3600) / 60
    seconds %= 60

    format("%d時間 %02d分 %02d秒", hours, minutes, seconds)
  end

  def formatted_elapsed_time_compact(seconds)
    total_minutes = (seconds / 60).floor
    hours = total_minutes / 60
    minutes = total_minutes % 60

    return "1分未満" if hours.zero? && minutes.zero?
    return "#{minutes}分" if hours.zero?
    return "#{hours}時間" if minutes.zero?

    "#{hours}時間#{minutes}分"
  end

  def formatted_japanese_datetime(time)
    "#{time.month}月#{time.day}日 #{time.strftime("%H:%M")}"
  end

  def formatted_allowed_start_chars(chars)
    chars.map { |char| "「#{char}」" }.join
  end
end
