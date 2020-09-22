# Protocolize
Generate protocol number for new records, tickets, issues, documents, and everything you need to identify. 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'protocolize'
```

Then install the dependencies:

```ruby
bundle
```

Copy the migration to project:

```ruby
rails g protocolize:install
```

Create the protocols table:

```ruby
rake db:migrate
```

## Usage

Include module to `app/models/application_record.rb`:

```ruby
class ApplicationRecord < ActiveRecord::Base
  include Protocolize::ActsAsProtocolable

  self.abstract_class = true
end
```

Set your model to act as protocolable associating with the protocol:

```ruby
class MyModel < ApplicationRecord
  acts_as_protocolable
end
```

That's it! Everytime the model configured to act as protocolable was created a protocol will be created together.