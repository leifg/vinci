# Vinci

[![Build Status](https://circleci.com/gh/leifg/vinci.svg?style=shield)](https://circleci.com/gh/leifg/vinci)

**DISCLAIMER:** Under heavy development.

This library is a general purpose client for JSON APIs. Ideally it will be possible just to configure your API and then go crazy.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add vinci to your list of dependencies in `mix.exs`:

        def deps do
          [{:vinci, "~> 0.0.1"}]
        end

  2. Ensure vinci is started before your application:

        def application do
          [applications: [:vinci]]
        end
