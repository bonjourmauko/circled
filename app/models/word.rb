class Word < Neo4j::Rails::Model
  property  :name, type: String, index: :exact
end
