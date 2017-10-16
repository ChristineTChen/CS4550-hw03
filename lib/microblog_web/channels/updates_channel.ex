defmodule MicroblogWeb.UpdatesChannel do
  use MicroblogWeb, :channel

  def join("updates:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("updates:" <> _user_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    broadcast socket, "ping", payload
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (updates:lobby).
  def handle_in("new_msg", %{"id" => id, "user_id" => user_id, "title" => title, "content" => content}, socket) do
    broadcast! socket, "new_msg", %{"id" => id, "user_id" => user_id, "title" => title, "content" => content}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
