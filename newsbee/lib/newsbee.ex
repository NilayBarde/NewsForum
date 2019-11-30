defmodule Newsbee do
  @moduledoc """
  Newsbee keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def web_url do
  web_api = "https://newsapi.org/v2/top-headlines?country=us"
  key = "d3c496691bb54f3b86ccb6f379d0bc9e"
  "#{web_api}&apiKey=#{key}"
  end
  

    def fetch_articles() do
    %{body: body} = HTTPoison.get! web_url()
    %{articles: article} = Poison.decode! body, keys: :atoms
    #[articles.Title, articles.Author, articles.Description, articles.Url, articles.UrlToImage
    #] |> Enum.join(", ")
  end


  def column_names() do 
  Enum.join ~w(Title Author Description Url UrlToImage)
  end

  def get_articles() do

  resp = HTTPoison.get! web_url()
  body = Poison.decode!(resp.body)
  body["articles"]
   
  end

  def get_author() do

author_list = []
 articles = 
 Enum.map(get_articles, fn (x) -> x["author"] end)  
#  |> Enum.each(fn (x) -> "anonymous" = nil end)
for article <- articles do
  if article === nil do
    Enum.concat(author_list, ["anonymous"])
  
  else
    Enum.concat(author_list, [article])
  end
end
  end

  def get_author2() do
    Enum.map(get_articles, fn (x) -> x["author"] end)
  end

 

  def get_title() do

Enum.map(get_articles, fn (x) -> x["title"] end)  
end


def get_description() do

Enum.map(get_articles, fn (x) -> x["description"] end)  
end

def get_url() do

Enum.map(get_articles, fn (x) -> x["url"] end)  
end


def get_urlToImage() do

Enum.map(get_articles, fn (x) -> x["urlToImage"] end)  
end

def get_source() do

Enum.map(get_articles, fn (x) -> x["source"] end)  
end


end
