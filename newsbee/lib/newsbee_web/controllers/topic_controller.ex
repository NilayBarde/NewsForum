defmodule NewsbeeWeb.TopicController do
  use NewsbeeWeb, :controller

<<<<<<< HEAD
  alias Newsbee.Topics
  alias Newsbee.Topics.Topic

  plug NewsbeeWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    IO.inspect(conn)
    IO.inspect("+++++++++++++++")
    topics = Topics.list_topics()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topics.change_topic(%Topic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic_params}) do
      # conn.assigns[:user] is the same as conn.assigns.user

    case Topics.create_topic(conn, topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_path(conn, :show, topic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
=======
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
>>>>>>> nilay
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
<<<<<<< HEAD
    render(conn, "show.html", topic: topic)
  end

  def edit(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
    changeset = Topics.change_topic(topic)
    render(conn, "edit.html", topic: topic, changeset: changeset)
=======
    render(conn, "topic.json", topic: topic)
>>>>>>> nilay
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Topics.get_topic!(id)

<<<<<<< HEAD
    case Topics.update_topic(topic, topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully.")
        |> redirect(to: Routes.topic_path(conn, :show, topic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topic: topic, changeset: changeset)
=======
    with {:ok, %Topic{} = topic} <- Topics.update_topic(topic, topic_params) do
      render(conn, "show.json", topic: topic)
>>>>>>> nilay
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
<<<<<<< HEAD
    {:ok, _topic} = Topics.delete_topic(topic)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: Routes.topic_path(conn, :index))
=======

    with {:ok, %Topic{}} <- Topics.delete_topic(topic) do
      send_resp(conn, :no_content, "")
    end
>>>>>>> nilay
  end
end
