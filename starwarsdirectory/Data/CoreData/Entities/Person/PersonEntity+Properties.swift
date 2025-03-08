//
//  PersonEntity+Properties.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData

extension PersonEntity {
    
    enum KeyPath {
        static let name = "name_nonOptional"
        static let height = "height_nonOptional"
        static let mass = "mass_nonOptional"
        static let hairColor = "hairColor_nonOptional"
        static let skinColor = "skinColor_nonOptional"
        static let eyeColor = "eyeColor_nonOptional"
        static let birthYear = "birthYear_nonOptional"
        static let gender = "gender_nonOptional"
        static let homeworld = "homeworld_nonOptional"
        static let films = "films_nonOptional"
        static let species = "species_nonOptional"
        static let vehicles = "vehicles_nonOptional"
        static let starships = "starships_nonOptional"
        static let url = "url_nonOptional"
        static let created = "created_nonOptional"
        static let edited = "edited_nonOptional"
    }
    
    static func entityDescription(in context: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "PersonEntity", in: context)
    }
    
    public var name: String {
        get { name_nonOptional ?? "Name Not Found" }
        set { name_nonOptional = newValue  }
    }
    
    public var created: String {
        get { created_nonOptional ?? "Created Date Not Found" }
        set { created_nonOptional = newValue  }
    }
    
    public var height: String {
        get { height_nonOptional ?? "Height Not Found" }
        set {height_nonOptional = newValue  }
    }
    
    public var edited: String {
        get { edited_nonOptional ?? "Edited Date Not Found" }
        set { edited_nonOptional = newValue  }
    }
    
    public var mass: String {
        get { mass_nonOptional ?? "Mass Not Found" }
        set { mass_nonOptional = newValue  }
    }
    
    public var hairColor: String {
        get { hairColor_nonOptional ?? "Hair Color Not Found" }
        set { hairColor_nonOptional = newValue  }
    }
    
    public var skinColor: String {
        get { skinColor_nonOptional ?? "Skin Color Not Found" }
        set { skinColor_nonOptional = newValue  }
    }
    
    public var eyeColor: String {
        get { eyeColor_nonOptional ?? "Eye Color Not Found" }
        set { eyeColor_nonOptional = newValue  }
    }
    
    public var birthYear: String {
        get { birthYear_nonOptional ?? "Birth Year Not Found" }
        set { birthYear_nonOptional = newValue  }
    }
    
    public var gender: String {
        get { gender_nonOptional ?? "Gender Not Found" }
        set { gender_nonOptional = newValue  }
    }
    
    public var homeworld: String {
        get { homeworld_nonOptional ?? "Homeworld URL Not Found" }
        set { homeworld_nonOptional = newValue  }
    }
    
    public var url: String {
        get { url_nonOptional ?? "URL Not Found" }
        set { url_nonOptional = newValue  }
    }
    
    public var films: [String] {
        get {
            guard let data = films_nonOptional else { return [] }
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                //TODO: Log error
                return []
            }
            
        }
        set {
            do {
                let filmUrls = try JSONEncoder().encode(newValue)
                films_nonOptional = filmUrls
            } catch {
                //TODO: Log error
            }
        }
    }
    
    public var species: [String] {
        get {
            guard let data = species_nonOptional else { return [] }
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                //TODO: Log error
                return []
            }
            
        }
        set {
            do {
                let speciesUrls = try JSONEncoder().encode(newValue)
                species_nonOptional = speciesUrls
            } catch {
                //TODO: Log error
            }
        }
    }
    
    public var vehicles: [String] {
        get {
            guard let data = vehicles_nonOptional else { return [] }
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                //TODO: Log error
                return []
            }
            
        }
        set {
            do {
                let vehicleUrls = try JSONEncoder().encode(newValue)
                vehicles_nonOptional = vehicleUrls
            } catch {
                //TODO: Log error
            }
        }
    }
    
    public var starships: [String] {
        get {
            guard let data = starships_nonOptional else { return [] }
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                //TODO: Log error
                return []
            }
            
        }
        set {
            do {
                let starshipUrls = try JSONEncoder().encode(newValue)
                starships_nonOptional = starshipUrls
            } catch {
                //TODO: Log error
            }
        }
    }
}
