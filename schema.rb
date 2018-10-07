require 'graphql'

class TestRelayMutation < GraphQL::Schema::RelayClassicMutation
  class MutationError < GraphQL::ExecutionError; end

  field :status, String, null: false

  def resolve
    { status: 'ok' }
    raise MutationError, 'mutation error'
  end
end

class TestMutation < GraphQL::Schema::Mutation
  class MutationError < GraphQL::ExecutionError; end

  field :status, String, null: false

  def resolve
    { status: 'ok' }
    raise MutationError, 'mutation error'
  end
end

class QueryType < GraphQL::Schema::Object
  class QueryError < GraphQL::ExecutionError; end

  field :test_query, String, null: false

  def test_query
    'test query'
    raise QueryError, 'query error'
  end
end

class MutationType < GraphQL::Schema::Object
  field :testRelayMutation, mutation: TestRelayMutation
  field :testMutation, mutation: TestMutation
end

class Schema < GraphQL::Schema
  query QueryType
  mutation MutationType

  rescue_from QueryType::QueryError do |e|
    puts "Query error rescued: #{e}"
  end

  # This block doesn't work
  rescue_from TestRelayMutation::MutationError do |e|
    puts "RelayMutation error rescued: #{e}"
  end

  # This block works
  rescue_from TestMutation::MutationError do |e|
    puts "Mutation error rescued: #{e}"
  end
end
