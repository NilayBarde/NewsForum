defmodule NewsbeeWeb.TopicController do
  use NewsbeeWeb, :controller

  plug NewsbeeWeb.Plugs.RequireAuth when action in [:show, :create, :delete]
  alias Newsbee.Topics
  alias Newsbee.Topics.Topic

  action_fallback NewsbeeWeb.FallbackController

  def index(conn, _params) do
    topics = Topics.list_topics()
    render(conn, "index.json", topics: topics)
  end

  def create(conn, %{"topic" => topic_params}) do
    user = Newsbee.Users.get_user!(topic_params["user_id"])
    with {:ok, %Topic{} = topic} <- Topics.create_topic(topic_params) do
      conn
      |> put_status(:created)
      |> render("show.json", topic: Map.put(topic, :user, user))
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
    render(conn, "topic_comments.json", topic: topic)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Topics.get_topic!(id)

    with {:ok, %Topic{} = topic} <- Topics.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)

    with {:ok, %Topic{}} <- Topics.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
  end
end