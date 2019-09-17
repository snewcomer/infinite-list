defmodule InfiniteListWeb.SongsLive do
  use Phoenix.LiveView

  @songs [
    {"https://s3.amazonaws.com/uifaces/faces/twitter/jarjan/128.jpg", "Armand", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/aio___/128.jpg", "Julio", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/kolage/128.jpg", "Morgan", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/sauro/128.jpg", "Marco", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/jina/128.jpg", "Gina", 255, 255},
  ]

  def render(assigns) do
    ~L"""
      <section>
        <h2>Infinite List</h2>

        <%= for {src, name, height, width} <- @songs do %>
          <div>
            <p><%= name %></p>
            <img class="artwork" src=<%= src %> alt="" height=<%= height %> width=<%= width %> />
          </div>
        <% end %>
        <div data-phx-sentinel phx-value-page="1"></div>
      </section>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, songs: @songs)}
  end

  def handle_event("infinite_enter", params, socket) do
    new_songs = @songs ++ [Enum.random(@songs), Enum.random(@songs)]
    {:noreply, assign(socket, songs: new_songs)}
  end
end
