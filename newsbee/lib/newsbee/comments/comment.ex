defmodule Newsbee.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:content]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Newsbee.Users.User
    belongs_to :topic, Newsbee.Topics.Topic

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :topic_id])
    |> validate_required([:content, :user_id, :topic_id])
  end
end
