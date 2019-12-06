defmodule Newsbee.Repo.Migrations.AddImgTitleTopics do
  use Ecto.Migration

  def change do
      alter table("topics") do  
      add :img_url, :string
      add :news_title, :string
      end
  end
end
