defmodule NewsbeeWeb.TopicControllerTest do
  use NewsbeeWeb.ConnCase

  alias Newsbee.Topics
<<<<<<< HEAD

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
=======
  alias Newsbee.Topics.Topic

  @create_attrs %{
    title: "some title"
  }
  @update_attrs %{
    title: "some updated title"
  }
>>>>>>> nilay
  @invalid_attrs %{title: nil}

  def fixture(:topic) do
    {:ok, topic} = Topics.create_topic(@create_attrs)
    topic
  end

<<<<<<< HEAD
  describe "index" do
    test "lists all topics", %{conn: conn} do
      conn = get(conn, Routes.topic_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Topics"
    end
  end

  describe "new topic" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.topic_path(conn, :new))
      assert html_response(conn, 200) =~ "New Topic"
=======
  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all topics", %{conn: conn} do
      conn = get(conn, Routes.topic_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
>>>>>>> nilay
    end
  end

  describe "create topic" do
<<<<<<< HEAD
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.topic_path(conn, :show, id)

      conn = get(conn, Routes.topic_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Topic"
=======
    test "renders topic when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.topic_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some title"
             } = json_response(conn, 200)["data"]
>>>>>>> nilay
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.topic_path(conn, :create), topic: @invalid_attrs)
<<<<<<< HEAD
      assert html_response(conn, 200) =~ "New Topic"
    end
  end

  describe "edit topic" do
    setup [:create_topic]

    test "renders form for editing chosen topic", %{conn: conn, topic: topic} do
      conn = get(conn, Routes.topic_path(conn, :edit, topic))
      assert html_response(conn, 200) =~ "Edit Topic"
=======
      assert json_response(conn, 422)["errors"] != %{}
>>>>>>> nilay
    end
  end

  describe "update topic" do
    setup [:create_topic]

<<<<<<< HEAD
    test "redirects when data is valid", %{conn: conn, topic: topic} do
      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @update_attrs)
      assert redirected_to(conn) == Routes.topic_path(conn, :show, topic)

      conn = get(conn, Routes.topic_path(conn, :show, topic))
      assert html_response(conn, 200) =~ "some updated title"
=======
    test "renders topic when data is valid", %{conn: conn, topic: %Topic{id: id} = topic} do
      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.topic_path(conn, :show, id))

      assert %{
               "id" => id,
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
>>>>>>> nilay
    end

    test "renders errors when data is invalid", %{conn: conn, topic: topic} do
      conn = put(conn, Routes.topic_path(conn, :update, topic), topic: @invalid_attrs)
<<<<<<< HEAD
      assert html_response(conn, 200) =~ "Edit Topic"
=======
      assert json_response(conn, 422)["errors"] != %{}
>>>>>>> nilay
    end
  end

  describe "delete topic" do
    setup [:create_topic]

    test "deletes chosen topic", %{conn: conn, topic: topic} do
      conn = delete(conn, Routes.topic_path(conn, :delete, topic))
<<<<<<< HEAD
      assert redirected_to(conn) == Routes.topic_path(conn, :index)
=======
      assert response(conn, 204)

>>>>>>> nilay
      assert_error_sent 404, fn ->
        get(conn, Routes.topic_path(conn, :show, topic))
      end
    end
  end

  defp create_topic(_) do
    topic = fixture(:topic)
    {:ok, topic: topic}
  end
end
