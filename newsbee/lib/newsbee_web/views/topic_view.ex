defmodule NewsbeeWeb.TopicView do
  use NewsbeeWeb, :view
<<<<<<< HEAD
  alias NewsbeeWeb.TopicView
  alias NewsbeeWeb.UserView
  alias NewsbeeWeb.CommentView

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    IO.inspect topic
    %{id: topic.id,
      title: topic.title,
      user: render_one(topic.user, UserView, "user.json")
  }
  end

 def render("topic_comments.json", %{topic: topic}) do
    IO.inspect topic
    %{id: topic.id,
      title: topic.title,
      user: render_one(topic.user, UserView, "user.json"),
      comments: render_many(topic.comments, CommentView, "comment.json")
  }
  end
=======
>>>>>>> origin/chen2
end
