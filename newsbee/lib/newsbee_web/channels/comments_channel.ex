defmodule NewsbeeWeb.CommentsChannel do
    import Ecto
    alias Newsbee.Repo
    use NewsbeeWeb, :channel
    alias Newsbee.Topics.Topic
    alias Newsbee.Comments.Comment

    def join("comments:" <> topic_id, _params, socket) do
        topic_id = String.to_integer(topic_id)
        
        topic = Topic
        |> Repo.get(topic_id)
        |> Repo.preload(:comments) # load up the association tied to the topic_id
                                    # now the topic has all the comments associated with it

        {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
    end

    def handle_in(name, %{"content" => content}, socket) do
        topic = socket.assigns.topic

        changeset = topic
        |> build_assoc(:comments)
        |> Comment.changeset(%{content: content})

        

        case Repo.insert(changeset) do
            {:ok, comment} ->
                broadcast!(socket, "comments:#{socket.assigns.topic.id}:new", %{comment: comment})
                {:reply, :ok, socket}
            
            {:error, _reason} ->
                {:reply, {:error, %{errors: changeset}}, socket}
        end        
    end
end