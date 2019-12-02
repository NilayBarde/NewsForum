defmodule Newsbee.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

<<<<<<< HEAD
=======
  @derive {Jason.Encoder, only: [:content]}

>>>>>>> origin/chen2
  schema "comments" do
    field :content, :string
    belongs_to :user, Newsbee.Users.User
    belongs_to :topic, Newsbee.Topics.Topic

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
<<<<<<< HEAD
    |> cast(attrs, [:content, :topic_id, :user_id])
    |> validate_required([:content, :topic_id, :user_id])
=======
    |> cast(attrs, [:content])
    |> validate_required([:content])
>>>>>>> origin/chen2
  end
end
