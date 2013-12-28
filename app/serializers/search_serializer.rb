class SearchSerializer < BaseSerializer
  attributes :id, :results

  def results
    ActiveModel::ArraySerializer.new(object.results)
  end
end
