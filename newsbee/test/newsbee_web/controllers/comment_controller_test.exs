defmodule NewsbeeWeb.CommentControllerTest do
  use NewsbeeWeb.ConnCase

  alias Newsbee.Comments
<<<<<<< HEAD

  @create_attrs %{content: "some content"}
  @update_attrs %{content: "some updated content"}
=======
  alias Newsbee.Comments.Comment

  @create_attrs %{
    content: "some content"
  }
  @update_attrs %{
    content: "some updated content"
  }
>>>>>>> nilay
  @invalid_attrs %{content: nil}

  def fixture(:comment) do
    {:ok, comment} = Comments.create_comment(@create_attrs)
    comment
  end

<<<<<<< HEAD
  describe "index" do
    test "lists all comments", %{conn: conn} do
      conn = get(conn, Routes.comment_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Comments"
    end
  end

  describe "new comment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.comment_path(conn, :new))
      assert html_response(conn, 200) =~ "New Comment"
=======
  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all comment", %{conn: conn} do
      conn = get(conn, Routes.comment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
>>>>>>> nilay
    end
  end

  describe "create comment" do
<<<<<<< HEAD
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.comment_path(conn, :create), comment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.comment_path(conn, :show, id)

      conn = get(conn, Routes.comment_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Comment"
=======
    test "renders comment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.comment_path(conn, :create), comment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.comment_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some content"
             } = json_response(conn, 200)["data"]
>>>>>>> nilay
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.comment_path(conn, :create), comment: @invalid_attrs)
<<<<<<< HEAD
      assert html_response(conn, 200) =~ "New Comment"
    end
  end

  describe "edit comment" do
    setup [:create_comment]

    test "renders form for editing chosen comment", %{conn: conn, comment: comment} do
      conn = get(conn, Routes.comment_path(conn, :edit, comment))
      assert html_response(conn, 200) =~ "Edit Comment"
=======
      assert json_response(conn, 422)["errors"] != %{}
>>>>>>> nilay
    end
  end

  describe "update comment" do
    setup [:create_comment]

<<<<<<< HEAD
    test "redirects when data is valid", %{conn: conn, comment: comment} do
      conn = put(conn, Routes.comment_path(conn, :update, comment), comment: @update_attrs)
      assert redirected_to(conn) == Routes.comment_path(conn, :show, comment)

      conn = get(conn, Routes.comment_path(conn, :show, comment))
      assert html_response(conn, 200) =~ "some updated content"
=======
    test "renders comment when data is valid", %{conn: conn, comment: %Comment{id: id} = comment} do
      conn = put(conn, Routes.comment_path(conn, :update, comment), comment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.comment_path(conn, :show, id))

      assert %{
               "id" => id,
               "content" => "some updated content"
             } = json_response(conn, 200)["data"]
>>>>>>> nilay
    end

    test "renders errors when data is invalid", %{conn: conn, comment: comment} do
      conn = put(conn, Routes.comment_path(conn, :update, comment), comment: @invalid_attrs)
<<<<<<< HEAD
      assert html_response(conn, 200) =~ "Edit Comment"
=======
      assert json_response(conn, 422)["errors"] != %{}
>>>>>>> nilay
    end
  end

  describe "delete comment" do
    setup [:create_comment]

    test "deletes chosen comment", %{conn: conn, comment: comment} do
      conn = delete(conn, Routes.comment_path(conn, :delete, comment))
<<<<<<< HEAD
      assert redirected_to(conn) == Routes.comment_path(conn, :index)
=======
      assert response(conn, 204)

>>>>>>> nilay
      assert_error_sent 404, fn ->
        get(conn, Routes.comment_path(conn, :show, comment))
      end
    end
  end

  defp create_comment(_) do
    comment = fixture(:comment)
    {:ok, comment: comment}
  end
end
