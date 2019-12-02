defmodule Newsbee.Topics do
  @moduledoc """
  The Topics context.
  """

<<<<<<< HEAD
  import Ecto
=======
>>>>>>> nilay
  import Ecto.Query, warn: false
  alias Newsbee.Repo

  alias Newsbee.Topics.Topic

  @doc """
  Returns the list of topics.
<<<<<<< HEAD

  ## Examples

      iex> list_topics()
      [%Topic{}, ...]

  """
  def list_topics do
    Repo.all(Topic)
=======
  ## Examples
      iex> list_topics()
      [%Topic{}, ...]
  """
  def list_topics do
    Repo.all(Topic)
    |> Repo.preload([:user])
>>>>>>> nilay
  end

  @doc """
  Gets a single topic.
<<<<<<< HEAD

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(conn, attrs \\ %{}) do
    conn.assigns.user
    |> build_assoc(:topics)
=======
  Raises `Ecto.NoResultsError` if the Topic does not exist.
  ## Examples
      iex> get_topic!(123)
      %Topic{}
      iex> get_topic!(456)
      ** (Ecto.NoResultsError)
  """
  def get_topic!(id) do
    Repo.get!(Topic, id)
    |> Repo.preload([:user])
  end

  @doc """
  Creates a topic.
  ## Examples
      iex> create_topic(%{field: value})
      {:ok, %Topic{}}
      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_topic(attrs \\ %{}) do
    %Topic{}
>>>>>>> nilay
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.
<<<<<<< HEAD

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

=======
  ## Examples
      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}
      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
>>>>>>> nilay
  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Topic.
<<<<<<< HEAD

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

=======
  ## Examples
      iex> delete_topic(topic)
      {:ok, %Topic{}}
      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}
>>>>>>> nilay
  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.
<<<<<<< HEAD

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{source: %Topic{}}

=======
  ## Examples
      iex> change_topic(topic)
      %Ecto.Changeset{source: %Topic{}}
>>>>>>> nilay
  """
  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end
end
