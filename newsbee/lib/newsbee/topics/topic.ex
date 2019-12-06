defmodule Newsbee.Topics.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    field :news_url, :string
    field :img_url, :string
    field :news_title, :string
    belongs_to :user, Newsbee.Users.User
    has_many :comments, Newsbee.Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:news_url, :title, :img_url, :news_title])
    |> validate_required( [:news_url])
  end
end
