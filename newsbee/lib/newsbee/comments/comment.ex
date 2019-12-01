defmodule Newsbee.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comment" do
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
