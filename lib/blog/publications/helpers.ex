defmodule Blog.Publications.Helpers do
  use Timex

  def time_ago_in_words(time, time_now \\ Timex.now) do
    to_time = Timex.to_gregorian_seconds(time)
    from_time = Timex.to_gregorian_seconds(time_now)
    distance_in_days = (from_time - to_time) / 86400
    |> round
    case distance_in_days do
      0 ->
        "меньше суток назад"
      1 ->
        "вчера"
      2 ->
        "позавчера"
      n when n in [3, 4, 22, 23, 24] ->
        "#{distance_in_days} дня назад"
      n when n in [5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 25, 26, 27, 28, 29] ->
        "#{distance_in_days} дней назад"
      21 ->
        "21 день назад"
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

  def truncate(text, opts \\ []) do
    max_length  = opts[:max_length] || 300
    omission    = opts[:omission] || "..."

    cond do
      not String.valid?(text) ->
        text
      String.length(text) < max_length ->
        text
      true ->
        length_with_omission = max_length - String.length(omission)

        "#{String.slice(text, 0, length_with_omission)}#{omission}"
    end
  end

end
