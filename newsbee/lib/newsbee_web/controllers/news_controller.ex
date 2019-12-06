defmodule NewsbeeWeb.NewsController do
  use NewsbeeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sports(conn, _params) do
    render(conn, "sports.html")
  end


  def business(conn, _params) do
    render(conn, "business.html")
  end


  def entertainment(conn, _params) do
    render(conn, "entertainment.html")
  end

  def health(conn, _params) do
    render(conn, "health.html")
  end

  def technology(conn, _params) do
    render(conn, "technology.html")
  end


end

