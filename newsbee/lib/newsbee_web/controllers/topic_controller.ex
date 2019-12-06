defmodule NewsbeeWeb.TopicController do
  use NewsbeeWeb, :controller

  alias Newsbee.Topics
  alias Newsbee.Topics.Topic

  # plug NewsbeeWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    
    
    topics = Topics.list_topics()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, params) do
    # IO.inspect(conn)
    IO.inspect("-------------")
    IO.inspect(params)
    
    # topic_params = %Topic{news_url: url[:news_url]}
    # IO.inspect(topic_params)
    changeset = Topic.changeset(%Topic{}, params)
    render conn, "new.html",  topic_params: params, changeset: changeset
  end

  def create(conn, params) do
      # conn.assigns[:user] is the same as conn.assigns.user
    IO.inspect("+++++++++++++++")
    IO.inspect(conn)
    IO.inspect("+++++++++++++++inspect params")
    %{"topic_params" => topic_params_map} = params
    %{"topic" => title_map} = params


    %{"news_url" => news_url_to_get} = topic_params_map
    %{"img_url" => img_url_to_get} = topic_params_map
    %{"news_title" => news_title_to_get} = topic_params_map
    %{"title" => title_to_get} = title_map

    
    topic_params = %{title: title_to_get, news_url: news_url_to_get,
                    img_url: img_url_to_get, news_title: news_title_to_get}
    
    IO.inspect(topic_params)
    
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
