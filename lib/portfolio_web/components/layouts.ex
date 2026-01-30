defmodule PortfolioWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use PortfolioWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
    Renders your app layout.

    This function is typically invoked from every template,
    and it often contains your application menu, sidebar,
    or similar.

    ## Examples

        <Layouts.app flash={@flash}>
          <h1>Content</h1>
        </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="navbar mt-0 px-4 lg:mt-3.5 lg:px-6">
      <div class="flex flex-1 items-center">
        <a
          href="/"
          class="bg-violet-800/50 flex w-fit items-center gap-4 rounded-md border border-violet-800 px-3 py-2 opacity-100 transition-opacity duration-200 hover:opacity-75"
        >
          <.icon name="hero-command-line-micro" class="size-8 text-violet-500" />
          <span class="text-xl font-bold lg:text-3xl">nathanwhyte.dev</span>
        </a>
      </div>

      <div class="flex-none">
        <div class="flex items-center gap-4">
          <%!-- TODO: "click to copy" for email address --%>
          <div class="flex items-center gap-2 text-lg font-medium opacity-100 transition-colors duration-200 hover:text-violet-400">
            <.icon name="hero-envelope-micro" class="size-4" /> nathanwhyte35@gmail.com
          </div>

          <.link_button
            href="https://www.linkedin.com/in/nathan-whyte/"
            label="LinkedIn"
            target="_blank"
            class="px-2.5 py-2 text-xl"
          >
            <:logo>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="size-6 fill-purple-fg"
                viewBox="0 0 448 512"
              >
                <path d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zm5 170.2l66.5 0 0 213.8-66.5 0 0-213.8zm71.7-67.7a38.5 38.5 0 1 1 -77 0 38.5 38.5 0 1 1 77 0zM317.9 416l0-104c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9l0 105.8-66.4 0 0-213.8 63.7 0 0 29.2 .9 0c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9l0 117.2-66.4 0z" />
              </svg>
            </:logo>
          </.link_button>

          <.link_button
            href="https://github.com/nathanwhyte"
            label="GitHub"
            target="_blank"
            class="px-2.5 py-2 text-xl"
          >
            <:logo>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="size-6 fill-purple-fg"
                viewBox="0 0 512 512"
              >
                <path d="M173.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3 .3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5 .3-6.2 2.3zm44.2-1.7c-2.9 .7-4.9 2.6-4.6 4.9 .3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM252.8 8c-138.7 0-244.8 105.3-244.8 244 0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1 100-33.2 167.8-128.1 167.8-239 0-138.7-112.5-244-251.2-244zM105.2 352.9c-1.3 1-1 3.3 .7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3 .3 2.9 2.3 3.9 1.6 1 3.6 .7 4.3-.7 .7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3 .7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3 .7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9s4.3 3.3 5.6 2.3c1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z" />
              </svg>
            </:logo>
          </.link_button>

          <%!-- QUES: fix themes? would need to have alternate versions for a lot of the icons --%>
          <%!-- <.theme_toggle /> --%>
        </div>
      </div>
    </header>

    <main class="px-4 lg:px-6">
      <div class="mx-auto space-y-4">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title="We can't find the internet"
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        Attempting to reconnect
        <.icon name="hero-arrow-path" class="size-3 ml-1 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title="Something went wrong!"
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        Attempting to reconnect
        <.icon name="hero-arrow-path" class="size-3 ml-1 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="card border-base-300 bg-base-300 relative flex flex-row items-center rounded-full border-2">
      <div class="border-1 border-base-200 bg-base-100 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left] absolute left-0 h-full w-1/3 rounded-full brightness-200" />

      <button
        class="flex w-1/3 cursor-pointer p-2"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex w-1/3 cursor-pointer p-2"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex w-1/3 cursor-pointer p-2"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="dark"
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end

  attr :href, :string, required: true
  attr :label, :string, required: true
  attr :icon, :string, default: nil
  attr :target, :string, default: nil
  attr :class, :string, default: nil
  attr :icon_class, :string, default: nil
  slot :logo

  # TODO: add hover and transition effects
  def link_button(assigns) do
    ~H"""
    <span class={[
      "bg-violet-800/50 inline-flex w-fit items-center gap-2 rounded-sm border border-violet-800 px-2 py-0.5",
      @class
    ]}>
      <%= if @logo != [] do %>
        {render_slot(@logo)}
      <% end %>
      <a href={@href} target={@target} class="font-bold">
        {@label}
      </a>
      <%= if @icon do %>
        <.icon name={@icon} class={@icon_class} />
      <% end %>
    </span>
    """
  end

  attr :href, :string, required: true
  attr :label, :string, required: true
  attr :icon, :string, default: nil
  attr :target, :string, default: nil
  attr :class, :string, default: nil
  attr :icon_class, :string, default: "size-3.5"

  # TODO: add hover and transition effects
  def inline_link_button(assigns) do
    ~H"""
    <span class={[
      "bg-violet-800/50 inline-flex w-fit items-center gap-1 rounded-sm border border-violet-800 px-1 py-0.5 text-sm",
      @class
    ]}>
      <a href={@href} target={@target} class="font-semibold">
        {@label}
      </a>
      <%= if @icon do %>
        <.icon name={@icon} class={@icon_class} />
      <% end %>
    </span>
    """
  end

  attr :actions_class, :string, default: nil
  slot :title, required: true
  slot :actions

  def project_card_header(assigns) do
    ~H"""
    <div class="flex items-center gap-4">
      <h2 class="inline-flex items-center gap-4 text-2xl">
        {render_slot(@title)}
      </h2>

      <%= if @actions != [] do %>
        <div class={["ml-auto flex gap-4", @actions_class]}>
          {render_slot(@actions)}
        </div>
      <% end %>
    </div>
    """
  end

  attr :label, :string, required: true
  slot :logo, required: false

  def skills_entry(assigns) do
    ~H"""
    <div class="bg-fuchsia-800/50 flex items-center gap-3 h-10 rounded-sm border border-fuchsia-800 px-3 py-2">
      <%= if @logo != [] do %>
        {render_slot(@logo)}
      <% end %>
      <span class="text-center text-sm font-medium">{@label}</span>
    </div>
    """
  end
end
