defmodule Newsbee.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :user, Newsbee.Users.User
    belongs_to :topic, Newsbee.Topics.Topic

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :topic_id, :user_id])
    |> validate_required([:content, :topic_id, :user_id])
  end
end
