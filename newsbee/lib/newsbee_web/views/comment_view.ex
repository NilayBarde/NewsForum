defmodule NewsbeeWeb.CommentView do
  use NewsbeeWeb, :view
  alias NewsbeeWeb.CommentView

  def render("index.json", %{comment: comment}) do
    %{data: render_many(comment, CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      content: comment.content}
  end
end
