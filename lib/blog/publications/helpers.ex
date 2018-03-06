defmodule Blog.Publications.Helpers do
  use Timex

  def time_ago_in_words(time, time_now \\ Timex.now) do
    to_time = Timex.to_gregorian_seconds(time)
    from_time = Timex.to_gregorian_seconds(time_now)
    distance_in_days = (from_time - to_time) / 86400
    |> round
    case distance_in_days do
      n when n < 1 ->
        "меньше суток назад"
      1 ->
        "вчера"
      2 ->
        "позавчера"
      {3, 4, 22, 23, 24} ->
        "#{distance_in_days} дня назад"
      {5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29} ->
        "#{distance_in_days} дней назад"
      21 ->
        "#{distance_in_days} день назад"
      30 ->
        "месяц назад"
      7 ->
        "неделю назад"
      14 ->
        "две недели назад"
      _ ->
        "больше месяца назад"
    end
  end

end
