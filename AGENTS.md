<!--
This file is for AI agents. It provides project context and guidelines.
It's not a place for conversational prose. It should be clear, concise, and practical.
URL: https://agents.md/
-->

# AGENTS.md

## Project Overview & Structure

This is a web application built with the Phoenix framework (v1.8), an Elixir-based web framework. The project is a personal website for "Nathan Whyte" and uses Tailwind CSS for styling.

- **Project Structure:**
  - `lib/`: Core application code.
    - `*_web/`: LiveViews, components, controllers, and HTML helpers.
  - `assets/`: JavaScript, CSS, and the static build pipeline.
  - `test/`: ExUnit and LiveView tests.
  - `priv/repo/`: Database migrations and seeds.
  - `priv/static/`: Compiled assets.
- **Module Organization:**
  - LiveViews should end with `Live` (e.g., `AppWeb.WeatherLive`). Templates use the `.heex` extension.
  - Use contexts for domain boundaries (e.g., `MyApp.Accounts`). Keep modules focused on a single purpose.

## Build, Test, and Development Commands

- `mix setup` — Install all dependencies and set up the database.
- `mix deps.get` — Fetch Elixir dependencies.
- `mix ecto.setup` — Create the database, run migrations, and seed data.
- `mix phx.server` — Run the app at `http://localhost:4000`.
- `mix test` — Run the entire test suite.
- `mix test test/path/to/file_test.exs` — Run tests in a specific file.
- `mix credo --strict` — Run static analysis (linter).
- `mix format` — Format the codebase.
- `mix precommit` — Run all local checks (format, lint, test) before opening a PR.

## Coding Style & Naming Conventions

- **Elixir:**
  - Use a 2-space indent.
  - Write pipe-friendly code.
  - Predicate function names should end with `?` (e.g., `valid?`), not `is_`.
  - Use a bang `!` for function variants that raise exceptions (e.g., `create!`).
- **LiveView & HEEx:**
  - Use `to_form/2` in LiveViews and the `<.form>` and `<.input>` components in templates.
  - Always begin LiveView templates with `<Layouts.app flash={@flash} current_scope={@current_scope}>`.
  - Use the `<.icon>` component for icons; never reference Heroicons modules directly.
- **HTTP:**
  - Use the `Req` library (`:req`) for all outbound HTTP requests.

## Testing Guidelines

- **Frameworks:** ExUnit, `Phoenix.LiveViewTest`, and `LazyHTML`.
- **File Naming:** Test files must end with `_test.exs`.
- **Assertions:** `describe` blocks and `test` names should be explicit. Prefer selectors with stable IDs you control (e.g., `#user-form`) over brittle assertions on text content.
- **Focused Testing:**
  - `mix test --failed` — Rerun only the tests that failed on the last run.
  - `mix test test/some_test.exs:42` — Run a single test on a specific line.

## Commit & Pull Request Guidelines

- **Commits:** Write a concise, imperative subject line (≤72 characters). Use the body to explain the "why" behind the change. Group related changes into a single commit.
- **Pull Requests:** Include a clear description, screenshots for UI changes, reproduction steps for bugs, and links to any related issues.
- **CI:** Ensure all checks pass locally by running `mix precommit` before pushing.

## Security & Configuration Tips

- Never use `String.to_atom/1` on user-provided input.
- Access changeset fields via `Ecto.Changeset.get_field/2`; do not use map access on Ecto structs.
- Preload associations that will be used in templates to avoid N+1 database queries.
