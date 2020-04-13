class UserForm
    include ActiveModel::Model
    include Virtus.model

    attribute :id, Integer
    attribute :login, String
    attribute :name, String
    attribute :type, String

    validates_presence_of :login, :name, :type

    attr_reader :record

    def presist
        @record = id ? User.find(id) : User.new
        self[:login] = @record.login
        self[:name] = @record.name

        if valid?
            @record.attributes = attributes.except(:id)
            @record.save!
            true
        else
            false
        end
    end

    def add_record_to_log
        Log.create!(user_login: @record.login, user_type: @record.type, date: Date.current)
    end
end