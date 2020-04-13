class OrderedByDateQuery
    def call(relation)
        relation
            .order(:date)
    end
end