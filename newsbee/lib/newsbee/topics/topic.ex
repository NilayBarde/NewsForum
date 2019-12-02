defmodule Newsbee.Topics.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :user, Newsbee.Users.User
<<<<<<< HEAD
    has_many :comments, Newsbee.Comments.Comment
=======
>>>>>>> nilay

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
<<<<<<< HEAD
    |> cast(attrs, [:title])
    |> validate_required([:title])
=======
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
>>>>>>> nilay
  end
end
