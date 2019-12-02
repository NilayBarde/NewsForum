defmodule Newsbee.Apis do

  def get_news() do
    resp = HTTPoison.get!("https://newsapi.org/v2/top-headlines?country=us&apiKey=0eb464d8c48340e19986055ffb1cdc74")
    data = Poison.decode!(resp.body)
    data["data"]
  end
end


