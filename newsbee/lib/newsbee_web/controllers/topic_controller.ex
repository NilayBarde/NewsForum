defmodule NewsbeeWeb.TopicController do
  use NewsbeeWeb, :controller
  
  alias Newsbee.Topics
  alias Newsbee.Topics.Topic

  # plug NewsbeeWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    
    
    topics = Topics.list_topics()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, url) do
    # IO.inspect(conn)
    IO.inspect("-------------")
    IO.inspect(url)
    
    
    conn = assign(conn, :news_url, url)
    IO.inspect(conn)
    changeset = Topics.change_topic(%Topic{})
    # IO.inspect(changeset)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
      # conn.assigns[:user] is the same as conn.assigns.user
    IO.inspect("+++++++++++++++")
    IO.inspect(conn)
    IO.inspect("+++++++++++++++inspect params")

    IO.inspect(params)
    topic_params = %{:title => params[:topic][:title], :news_url => conn.assigns.url}
    # %{"topic" => topic_params} = params
    case Topics.create_topic(topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_path(conn, :show, topic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
    render(conn, "show.html", topic: topic)
  end

  def edit(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
    changeset = Topics.change_topic(topic)
    render(conn, "edit.html", topic: topic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topic" => topic_params}) do
    topic = Topics.get_topic!(id)

    case Topics.update_topic(topic, topic_params) do
      {:ok, topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully.")
        |> redirect(to: Routes.topic_path(conn, :show, topic))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topic: topic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic = Topics.get_topic!(id)
    {:ok, _topic} = Topics.delete_topic(topic)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: Routes.topic_path(conn, :index))
  end
end
