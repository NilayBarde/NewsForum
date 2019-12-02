defmodule NewsbeeWeb.CommentController do
  use NewsbeeWeb, :controller

  alias Newsbee.Comments
  alias Newsbee.Comments.Comment

<<<<<<< HEAD
  def index(conn, _params) do
    comments = Comments.list_comments()
    render(conn, "index.html", comments: comments)
  end

  def new(conn, _params) do
    changeset = Comments.change_comment(%Comment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"comment" => comment_params}) do
    case Comments.create_comment(comment_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment created successfully.")
        |> redirect(to: Routes.comment_path(conn, :show, comment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
=======
  action_fallback NewsbeeWeb.FallbackController

  def index(conn, _params) do
    comment = Comments.list_comment()
    render(conn, "index.json", comment: comment)
  end

  def create(conn, %{"comment" => comment_params}) do
    with {:ok, %Comment{} = comment} <- Comments.create_comment(comment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.comment_path(conn, :show, comment))
      |> render("show.json", comment: comment)
>>>>>>> nilay
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Comments.get_comment!(id)
<<<<<<< HEAD
    render(conn, "show.html", comment: comment)
  end

  def edit(conn, %{"id" => id}) do
    comment = Comments.get_comment!(id)
    changeset = Comments.change_comment(comment)
    render(conn, "edit.html", comment: comment, changeset: changeset)
=======
    render(conn, "show.json", comment: comment)
>>>>>>> nilay
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Comments.get_comment!(id)

<<<<<<< HEAD
    case Comments.update_comment(comment, comment_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Comment updated successfully.")
        |> redirect(to: Routes.comment_path(conn, :show, comment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", comment: comment, changeset: changeset)
=======
    with {:ok, %Comment{} = comment} <- Comments.update_comment(comment, comment_params) do
      render(conn, "show.json", comment: comment)
>>>>>>> nilay
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Comments.get_comment!(id)
<<<<<<< HEAD
    {:ok, _comment} = Comments.delete_comment(comment)

    conn
    |> put_flash(:info, "Comment deleted successfully.")
    |> redirect(to: Routes.comment_path(conn, :index))
=======

    with {:ok, %Comment{}} <- Comments.delete_comment(comment) do
      send_resp(conn, :no_content, "")
    end
>>>>>>> nilay
  end
end
