defmodule Newsbee.Repo.Migrations.AddUrlToTopics do
  use Ecto.Migration

  def change do
    alter table("topics") do
      add :news_url, :string
    end
  end
end
