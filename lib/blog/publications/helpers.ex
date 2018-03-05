defmodule Blog.Publications.Helpers do
  use Timex

  def time_ago_in_words(time, time_now \\ Timex.now) do
    to_time = Timex.to_gregorian_seconds(time)
    from_time = Timex.to_gregorian_seconds(time_now)
    distance_in_seconds = from_time - to_time
    case distance_in_seconds do
      n when n in 0..86400 ->
        "меньше суток назад"
      n when n in 86401..172800 ->
        "вчера"
      n when n in 172801..259200 ->
        "позавчера"
      n when n in 259201..345600 ->
        "три дня назад"
      n when n in 345601..432000 ->
        "четыре дня назад"
      n when n in 432001..518400 ->
        "пять дней назад"
      n when n in 518401..604800 ->
        "шесть дней назад"
      n when n in 604801..691200 ->
        "неделю назад"
      n when n > 691200 ->
        "больше недели назад"
    end
  end

end
