defmodule BlogWeb.BlogView do
  use BlogWeb, :view
  import Blog.Publications.Helpers, only: [time_ago_in_words: 1]
end
