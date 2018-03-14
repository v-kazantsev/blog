defmodule BlogWeb.BlogView do
  use BlogWeb, :view
  import Scrivener.HTML
  def markdown(body) do
    body
    |> Earmark.as_html
    |> raw
  end
end
