defmodule NewsbeeWeb.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller


    alias Newsbee.Repo
    alias Newsbee.User

    def init(_params) do
        
    end

    # after this plug is called, every conn will access to the user object
    def call(conn, _params) do
        user_id = get_session(conn, :user_id) #get user_id from conn object
        
        cond do
            user = user_id && Repo.get(User, user_id) -> # fetch user from DB
            assign(conn, :user, user)       #use assign functino to assign :user to conn
            # conn,assigns.user => user struct

            true -> 
                assign(conn, :user, nil)
        end

        
    end
end