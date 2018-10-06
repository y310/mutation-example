require './schema'

query = <<-QUERY
mutation Test {
  testMutation(input: {}) {
    status
  }
}
QUERY

result = Schema.execute(query: query)
pp result.to_h
