class TestMutation < GraphQL::Schema::RelayClassicMutation
  class TestError < GraphQL::ExecutionError; end

  field :status, String, null: false

  def resolve
    { status: 'ok' }
    raise TestError, 'test error'
  end
end
