defmodule Newsbee.Topics.Topic do
<<<<<<< HEAD
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
=======
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "topics" do
      field :title, :string
      belongs_to :user, Newsbee.Users.User
      has_many :comments, Newsbee.Comments.Comment, on_delete: :delete_all
  
      timestamps()
    end
  
    @doc false
    def changeset(topic, attrs) do
      topic
      |> cast(attrs, [:title, :user_id])
      |> validate_required([:title, :user_id])
    end
  end
>>>>>>> song1205
