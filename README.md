# Vinci

[![Build Status](https://circleci.com/gh/leifg/vinci.svg?style=shield)](https://circleci.com/gh/leifg/vinci)

**DISCLAIMER:** Under heavy development.

This library is a general purpose client for JSON APIs. Ideally it will be possible just to configure your API and then go crazy.

## Installation

Install with:

  1. Add vinci to your list of dependencies in `mix.exs`:

        def deps do
          [{:vinci, "~> 0.0.1"}]
        end

  2. Ensure vinci is started before your application:

        def application do
          [applications: [:vinci]]
        end

## Usage

If your API service is available you can use as follows:

    Vinci.call(api_name, route_id, params, headers)

For `params` and `headers` you have to refer to the official API usage. The parameters are passed in as a JSON body.

For `api_name` and `route_id` refer to the documentation of the vinci package.

## List of available Vinci packages

For the following APIs there are packages available:

  - [dropbox](https://github.com/leifg/vinci_dropbox)
