require 'graphql'
require './mutation_type'

class Schema < GraphQL::Schema
  mutation MutationType
end
