defmodule BlogWeb.BlogView do
  use BlogWeb, :view
  import Blog.Publications.Helpers, only: [time_ago_in_words: 1, truncate: 2]
  import Scrivener.HTML
end
