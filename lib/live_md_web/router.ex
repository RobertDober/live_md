defmodule LiveMdWeb.Router do
  use LiveMdWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveMdWeb do
    pipe_through :browser

    get "/", MarkdownController, :index
    resources "/markdowns", MarkdownController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveMdWeb do
  #   pipe_through :api
  # end
end
