defmodule NewsbeeWeb.NewsController do
  use NewsbeeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sports(conn, _params) do
    render(conn, "sports.html")
  end
end

