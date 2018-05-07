class Ahoy::Store < Ahoy::DatabaseStore
    def track_visit(data)
        #new visit
    end

    def track_event(data)
        #new event occured
    end

    def authenticate(data)
        #Account authenticated
    end
end

# set to true for JavaScript tracking
Ahoy.api = false
