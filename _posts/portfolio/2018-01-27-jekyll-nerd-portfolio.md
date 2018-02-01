---
layout: post
title: Jekyll Nerd Portfolio
date: 2018-01-27 15:18:10 -0600
categories: portfolio
featured-img: blog/2018-01-27-jekyll-nerd-portfolio.jpg
---

Jekyll portfolio theme for nerds

## Installation

1. Add the following line to your `Gemfile`:

    ```ruby
    gem "jekyll-nerd-portfolio"
    ```

2. Add the following line to your `_config.yml`:

    ```yaml
    theme: jekyll-nerd-portfolio
    ```

3. Run the following command
    ```sh
    bundle
    ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hello. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `bundle install`.

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

When your theme is released, only the files in `_layouts`, `_includes`, `_sass` and `assets` tracked with Git will be bundled.
To add a custom directory to your theme-gem, please edit the regexp in `jekyll-nerd-portfolio.gemspec` accordingly.

## License

The theme is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
