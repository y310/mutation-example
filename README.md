Reproducing graphql-ruby rescue_from issue.

```
$ bundle exec ruby run.rb
Query error rescued: query error
{"data"=>nil,
 "errors"=>
  [{"message"=>"GraphQL::ExecutionError",
    "locations"=>[{"line"=>2, "column"=>3}],
    "path"=>["testQuery"]}]}

{"data"=>{"testRelayMutation"=>nil},
 "errors"=>
  [{"message"=>"mutation error",
    "locations"=>[{"line"=>5, "column"=>3}],
    "path"=>["testRelayMutation"]}]}

Mutation error rescued: mutation error
{"data"=>{"testMutation"=>nil},
 "errors"=>
  [{"message"=>"GraphQL::ExecutionError",
    "locations"=>[{"line"=>10, "column"=>3}],
    "path"=>["testMutation"]}]}
```
