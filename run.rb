require './schema'

query = <<-QUERY
query TestQuery {
  testQuery
}
mutation TestRelayMutation {
  testRelayMutation(input: {}) {
    status
  }
}
mutation TestMutation {
  testMutation {
    status
  }
}
QUERY

result = Schema.execute(query: query, operation_name: 'TestQuery')
pp result.to_h
puts

result = Schema.execute(query: query, operation_name: 'TestRelayMutation')
pp result.to_h
puts

result = Schema.execute(query: query, operation_name: 'TestMutation')
pp result.to_h
puts
