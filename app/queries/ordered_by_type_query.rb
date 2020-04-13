class OrderedByTypeQuery
    def call(relation)
        relation
            .order(:type)
    end
end