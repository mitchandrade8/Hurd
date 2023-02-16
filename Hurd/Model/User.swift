//
//  User.swift
//  Hurd
//
//  Created by clydies freeman on 1/10/23.
//

import Foundation
import FirebaseFirestoreSwift



enum NoteType: String, CaseIterable {
    case important = "Important"
    case generalNote = "General Note"
    
    var iconString: String {
        switch self {
        case .important:
            return "exclamationmark.triangle.fill"
        case .generalNote:
            return "note.text"
        }
    }
}

struct User: Codable {
    var id: String?
    let createdAt: Double?
    let isFinishedOnboarding: Bool
    let emailAddress: String?
    let phoneNumber: String?
    let gender: String?
    let ethnicity: String?
    let bio: String
    let firstName: String
    let lastName: String
    var profileImageUrl: String?
    var trips: [String]? // trip ID... reference
}

extension User {
    static let mockUser1 = User(id: "1",createdAt: 33424332432, isFinishedOnboarding: true, emailAddress: "c.edward.freeman@gmail.com", phoneNumber: "617-233-1242", gender: "I really like alot of ppl. that i liek to go over the same thing i want to get some money and i like more money than i have mow. lets go!", ethnicity: "Clyde", bio: "Freeman", firstName: "mockAvatarImage", lastName: "", profileImageUrl: "")
    
    static let mockUser2 = User(id: "2",createdAt: 33424332432, isFinishedOnboarding: true, emailAddress: "c.edward.freeman@gmail.com", phoneNumber: "617-233-1242", gender: "I really like alot of ppl. that i liek to go over the same thing i want to get some money and i like more money than i have mow. lets go!", ethnicity: "Clyde", bio: "Freeman", firstName: "mockAvatarImage", lastName: "", profileImageUrl: "")
    
    static let mockUser3 = User(id: "3",createdAt: 33424332432, isFinishedOnboarding: true, emailAddress: "c.edward.freeman@gmail.com", phoneNumber: "617-233-1242", gender: "I really like alot of ppl. that i liek to go over the same thing i want to get some money and i like more money than i have mow. lets go!", ethnicity: "Clyde", bio: "Freeman", firstName: "mockAvatarImage",  lastName: "", profileImageUrl: "")
    
    static let mockUser4 = User(id: "4",createdAt: 33424332432, isFinishedOnboarding: true, emailAddress: "c.edward.freeman@gmail.com", phoneNumber: "617-233-1242", gender: "I really like alot of ppl. that i liek to go over the same thing i want to get some money and i like more money than i have mow. lets go!", ethnicity: "Clyde", bio: "Freeman", firstName: "mockAvatarImage",  lastName: "", profileImageUrl: "")
    
    static let mockUser5 = User(id: "5",createdAt: 33424332432, isFinishedOnboarding: true, emailAddress: "c.edward.freeman@gmail.com", phoneNumber: "617-233-1242", gender: "I really like alot of ppl. that i liek to go over the same thing i want to get some money and i like more money than i have mow. lets go!", ethnicity: "Clyde", bio: "Freeman", firstName: "mockAvatarImage",  lastName: "", profileImageUrl: "")
}

struct Trip: Codable {
    @DocumentID var id: String?
    var tripName: String
    var tripDestination: String
    var tripType: String
    var tripCostEstimate: Double
    var tripStartDate: Double
    var tripEndDate: Double
    var tripDescription: String?
    var hurd: Hurd?// Reference
    var suggestions: String? // Reference
    var tripImageURLString: UnsplashPhoto?
    //Additional Details of a trip
}


struct UnsplashPhoto: Codable {
    var photoURL: String?
    var authorName: String?
}

struct TripSuggestions: Codable {
    @DocumentID var id: String?
    let locationSuggestions: [Suggestion]?
    let lodgingSuggestions: [Suggestion]?
    let dateSuggestions: [Suggestion]?
    
}

struct Suggestion: Codable {
    let userId: String
    let Suggestion: String
}

struct DateSuggestion: Codable {
    let userId: String
    let startDate: Double
    let endDate: Double
}

struct Hurd: Codable {
    @DocumentID var id: String?
    var name: String?
    var members: [String]?
    var organizer: String
    var hurdID: String?
}

struct Note: Codable, Hashable {
    @DocumentID var id: String?
    var title: String
    var body: String
    var noteType: String
    var timestamp: Double
    var authorID: String
}

extension Note {
    static let mockNote = Note(id: UUID().uuidString, title: "Passport 🧨", body: "Everyone remember to bring your passports please", noteType: NoteType.important.rawValue, timestamp: 3434324233, authorID: UUID().uuidString)
    
    static let mockNote2 = Note(id: UUID().uuidString, title: "Hurd Rules 🦬", body: "Everyone remember to bring your passports please", noteType: NoteType.generalNote.rawValue, timestamp: 3434324233, authorID: UUID().uuidString)
}


extension Hurd {
    static let mockHurd = Hurd(organizer: "vwefwevewewe")
}

extension Trip {
    static let mockTrip = Trip(tripName: "Mock Trip", tripDestination: "Boston, MA", tripType: "Cruise", tripCostEstimate: 5600.0,tripStartDate: 329773023, tripEndDate: 3434324233, hurd: Hurd.mockHurd, tripImageURLString: UnsplashPhoto(photoURL: "https://via.placeholder.com/300.png/09f/fff", authorName: "Fake Author"))
    
    static let mockTrip2 = Trip(tripName: "Mock Trip 2", tripDestination: "Charlotte, NC", tripType: "Adventure", tripCostEstimate: 600.0,tripStartDate: 329773023, tripEndDate: 3434324233, tripDescription: "i  dont like it becuase this is so scrayx i and i liek that most ppl dont like to travel and i konw thaty mosty ppl will like to tracvel but cant. " ,hurd: Hurd.mockHurd)
    
    static let mockTrip3 = Trip(tripName: "Mock Trip 3", tripDestination: "Dallas, TX", tripType: "Road Trip", tripCostEstimate: 7600.0,tripStartDate: 329773023, tripEndDate: 3434324233, hurd: Hurd.mockHurd)
    
    static let mockTrip4 = Trip(tripName: "Mock Trip 4", tripDestination: "Houston, TX", tripType: "Vacation", tripCostEstimate: 8600.0,tripStartDate: 329773023, tripEndDate: 3434324233, hurd: Hurd.mockHurd)
    
    static let mockTrip5 = Trip(tripName: "Mock Trip 5", tripDestination: "Los Angeles, LA", tripType: "Excursion", tripCostEstimate: 9600.0,tripStartDate: 329773023, tripEndDate: 3434324233, hurd: Hurd.mockHurd)
    
    static let mockTrip6 = Trip(tripName: "Mock Trip 6", tripDestination: "New York City, NY", tripType: "Business", tripCostEstimate: 500.0,tripStartDate: 329773023, tripEndDate: 3434324233, hurd: Hurd.mockHurd)
    
    var tripCostString: String {
        return String(format: "%.02f", self.tripCostEstimate)
    }
    
    var iconName: String {
        switch self.tripType {
        case "Vacation":
            return "beach.umbrella"
        case "Cruise":
            return "sailboat.fill"
        case "Road Trip":
            return "car.fill"
        case "Excursion":
            return "figure.play"
        case "Adventure":
            return "figure.hiking"
        case "Business":
            return "suitcase.fill"
        default:
            return ""
            
        }
    }
    
    var dateRangeString: String {
        let startDate = Date(timeIntervalSince1970: self.tripStartDate)
        let endDate = Date(timeIntervalSince1970: self.tripEndDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "MM/dd/yy" //Specify your format that you want
        let strDate = dateFormatter.string(from: startDate)
        let eDate = dateFormatter.string(from: endDate)
        
        return "\(strDate) - \(eDate)"
    }
}
