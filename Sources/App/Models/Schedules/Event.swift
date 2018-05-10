import FluentPostgreSQL
import Vapor

final class Event: Codable {
    var id: Int?
    var name: String
    var info: String?
    var startDate: Date
    var endDate: Date
    var isActive: Bool
    var scheduleId: Schedule.ID
    var venueId: Venue.ID

    init(name: String, info: String, startDate: Date, endDate: Date,
         isActive: Bool, scheduleId: Schedule.ID, venueId: Venue.ID) {
        self.name = name
        self.info = info
        self.startDate = startDate
        self.endDate = endDate
        self.isActive = isActive
        self.scheduleId = scheduleId
        self.venueId = venueId
    }
}

extension Event: PostgreSQLModel { }
extension Event: Migration { }
extension Event: Content { }
extension Event: Parameter { }

extension Event {
    var schedule: Parent<Event,Schedule> {
        return parent(\.scheduleId)
    }
    
    var tags: Siblings<Event, Tag, EventCategoryPivot> {
        return siblings()
    }
}
