defmodule BlogWeb.Helpers do
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

  def truncate(text, options \\ []) do
    len = options[:length] || 300
    omi = options[:omission] || "..."
    sep = options[:separator] || " "

    cond do
     !String.valid?(text)       -> text
      String.length(text) < len -> text
      true ->
        len_with_omi = len - String.length(omi)
        stop =  rindex(text, sep, len_with_omi) || len_with_omi
        "#{String.slice(text, 0, stop)}#{omi}"
    end
  end

  defp rindex(text, str, offset) do
    text =
      if offset do
        String.slice(text, 0, offset)
      else
        text
      end

    revesed = text |> String.reverse
    matchword = String.reverse(str)

    case :binary.match(revesed, matchword) do
      {at, strlen} ->
        String.length(text) - at - strlen
      :nomatch     ->
        nil
    end
  end


  def admin?(conn) do
    conn.assigns[:admin] != nil
  end


end
