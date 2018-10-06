require './test_mutation'

class MutationType < GraphQL::Schema::Object
  field :testMutation, mutation: TestMutation
end
