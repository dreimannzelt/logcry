# Logcry

Logcry will take hashes and turn them into wonderful tiny KVP based log entries as seen in Heroku logs:

```
model#method foo=bar bar=barz
```

As an extra benefit you can log and measure the your code which will add your logline with a `_runtime` key:

```
model#method foo=bar bar=barz _runtime=1.000
```

## Installation

Add this line to your application's Gemfile:

    gem 'logcry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logcry


## Configuration

### Rails

You are pretty much set up from the start as the methods are included automatically.

### Ruby

Just include the module

```ruby
require "logcry/loggable"

class AwesomeModel
  include Logcry::Loggable
end
````

## Usage

## cry

Without provided hash it will look for a method `to_cry`

```ruby
class AwesomeModel
  def magic
    cry
    "mystery"
  end

  def wonderful
    "magic"
  end

  def to_cry
    {
      wonderful: wonderful
    }
  end
end
```

```bash
> AwesomeModel.new.magic
awesome_model#magic wonderful=magic
=> mystery
```

If you provide a hash, this will be merged with a `#to_cry`

```ruby
class AwesomeModel
  def magic
    cry(magic: "stick")
    "mystery"
  end

  def wonderful
    "magic"
  end

  def to_cry
    {
      wonderful: wonderful
    }
  end
end
```

```bash
> AwesomeModel.new.magic
awesome_model#magic magic=stick wonderful=magic
=> "mystery"
```

## run_and_cry

As an extra benefit you can wrap a block of code and let it be measured:

```ruby
class AwesomeModel
  def magic
    run_and_cry do
      "mystery"
      sleep(10)
    end
  end

  def wonderful
    "magic"
  end

  def to_cry
    {
      wonderful: wonderful
    }
  end
end
```

```bash
> AwesomeModel.new.magic
awesome_model#magic wonderful=magic _runtime=10.000
=> "mystery"
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
