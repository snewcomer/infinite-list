defmodule InfiniteListWeb.ArtworkLive do
  use Phoenix.LiveView

  @artwork [
    {"https://s3.amazonaws.com/uifaces/faces/twitter/jarjan/128.jpg", "Armand", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/aio___/128.jpg", "Julio", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/kolage/128.jpg", "Morgan", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/sauro/128.jpg", "Marco", 255, 255},
    {"https://s3.amazonaws.com/uifaces/faces/twitter/jina/128.jpg", "Gina", 255, 255},
  ]

  def render(assigns) do
    ~L"""
      <article>
        <%= for {src, name, height, width} <- @artwork do %>
          <div>
            <p><%= name %></p>
            <img class="artwork" src=<%= src %> alt="" height=<%= height %> width=<%= width %> />
          </div>
        <% end %>
      </article>

      <article phx-hook="LazyArtwork">
        <%= for {src, name, height, width} <- @artwork do %>
          <div>
            <p><%= name %></p>
            <img
              class="artwork"
              src=<%= InfiniteListWeb.Router.Helpers.static_url(InfiniteListWeb.Endpoint, "/images/1x1.gif") %> ;
              data-src=<%= src %>
              alt=<%= name %>
              height=<%= height %>
              width=<%= width %>
              data-lazy-load />
          </div>
        <% end %>
      </article>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, artwork: @artwork)}
  end
end

