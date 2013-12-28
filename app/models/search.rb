class Search
  include Mongoid::Document

  field :query, type: String
  embeds_many :results, class_name: 'SearchResult'

  validates :query, presence: true


  def query_and_save_results!
    raise RuntimeError.new("No query") unless query.present?

    results = Geocoder.search(query)
    results.each do |result|
      self.results << SearchResult.build_from_geocoder(result)
    end
    save!
  end
end
