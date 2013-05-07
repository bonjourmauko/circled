class Word < Neo4j::Rails::Model
  property      :name, type: String, index: :exact
  attr_accessor :synonym

  has_n(:synonyms).to Word
end
