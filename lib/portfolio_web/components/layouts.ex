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
    <header class="navbar px-4 lg:px-6 mt-0 lg:mt-3.5">
      <div class="flex-1 flex items-center gap-8">
        <a
          href="/"
          class="flex w-fit items-center gap-4 opacity-100 hover:opacity-75 transition-opacity duration-200"
        >
          <.icon name="hero-command-line" class="size-8 lg:size-12 text-purple-400" />
          <span class="text-xl lg:text-3xl font-bold">Nathan Whyte</span>
        </a>
        <a
          href="/"
          class="opacity-100 hover:opacity-75 transition-opacity duration-200"
        >
          <span class="text-base lg:text-lg font-medium">Projects</span>
        </a>
        <a
          href="/"
          class="opacity-100 hover:opacity-75 transition-opacity duration-200"
        >
          <span class="text-base lg:text-lg font-medium">Skills</span>
        </a>
        <a
          href="/"
          class="opacity-100 hover:opacity-75 transition-opacity duration-200"
        >
          <span class="text-base lg:text-lg font-medium">What's in My Homelab</span>
        </a>
      </div>

      <div class="flex-none">
        <div class="flex gap-4 items-center">
          <.link_button
            href="https://www.linkedin.com/in/nathan-whyte/"
            label="LinkedIn"
            icon="hero-arrow-top-right-on-square-micro"
            target="_blank"
          />

          <.link_button
            href="https://github.com/nathanwhyte"
            label="GitHub"
            icon="hero-arrow-top-right-on-square-micro"
            target="_blank"
          />

          <div>
            <%!-- TODO: fix themes --%>
            <.theme_toggle />
          </div>
        </div>
      </div>
    </header>

    <main class="px-4 lg:px-16">
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
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
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
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
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
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
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

  def link_button(assigns) do
    ~H"""
    <span class={[
      "inline-flex w-fit items-center gap-2 rounded-sm rounded-md border border-violet-800 bg-violet-800/50 px-2 py-0.5",
      @class
    ]}>
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

  def inline_link_button(assigns) do
    ~H"""
    <span class={[
      "inline-flex w-fit text-sm items-center gap-1 rounded-sm border border-violet-800 bg-violet-800/50 px-1 py-0.5",
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
      <h2 class="text-2xl inline-flex items-center gap-4">
        {render_slot(@title)}
      </h2>

      <%= if @actions != [] do %>
        <div class={["flex gap-4 ml-auto", @actions_class]}>
          {render_slot(@actions)}
        </div>
      <% end %>
    </div>
    """
  end
end
