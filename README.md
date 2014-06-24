# Rails components

This is an aproach to modularize Rails applications into smaller apps.

A component sits between a full rails app and a rails plugin/engine.
They are designed to split your app into logical segments without
impacting the development speed, specially at the early stages.

Every feature of a rails app should work while inside of a component
including rails app reloading, migrations, initializers and assets.

## Usage

Add it to your Gemfile

```ruby
gem 'rails-components'
```

And create your first component by calling

```bash
rails generate component your_component
```

Components are created inside the components directory on the
root of the rails app and have a structure very similar to a
common rails app.

## Contributing

1. Fork it ( https://github.com/sagmor/rails-components/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
