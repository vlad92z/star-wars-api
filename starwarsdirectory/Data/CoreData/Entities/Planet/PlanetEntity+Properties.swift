//
//  PlanetEntity+Properties.swift
//  starwarsdirectory
//
//  Created by Vlad on 06/03/2025.
//
import CoreData
import os.log

extension PlanetEntity {
    
    enum KeyPath {
        static let climate = "climate_nonOptional"
        static let created = "created_nonOptional"
        static let diameter = "diameter_nonOptional"
        static let edited = "edited_nonOptional"
        static let films = "films_nonOptional"
        static let gravity = "gravity_nonOptional"
        static let name = "name_nonOptional"
        static let orbitalPeriod = "orbitalPeriod_nonOptional"
        static let population = "population_nonOptional"
        static let residents = "residents_nonOptional"
        static let rotationPeriod = "rotationPeriod_nonOptional"
        static let surfaceWater = "surfaceWater_nonOptional"
        static let terrain = "terrain_nonOptional"
        static let url = "url_nonOptional"
        static let page = "page"
    }
    
    static func entityDescription(in context: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "PlanetEntity", in: context)
    }
    
    public var climate: String {
        get { climate_nonOptional ?? "Climate Not Found" }
        set { climate_nonOptional = newValue  }
    }
    
    public var created: String {
        get { created_nonOptional ?? "Created Date Not Found" }
        set { created_nonOptional = newValue  }
    }
    
    public var diameter: String {
        get { diameter_nonOptional ?? "Diameter Not Found" }
        set {diameter_nonOptional = newValue  }
    }
    
    public var edited: String {
        get { edited_nonOptional ?? "Edited Date Not Found" }
        set { edited_nonOptional = newValue  }
    }
    
    public var gravity: String {
        get { gravity_nonOptional ?? "Gravity Not Found" }
        set { gravity_nonOptional = newValue  }
    }
    
    public var name: String {
        get { name_nonOptional ?? "Name Not Found" }
        set { name_nonOptional = newValue  }
    }
    
    public var orbitalPeriod: String {
        get { orbitalPeriod_nonOptional ?? "Orbital Period Not Found" }
        set { orbitalPeriod_nonOptional = newValue  }
    }
    
    public var population: String {
        get { population_nonOptional ?? "Population Not Found" }
        set { population_nonOptional = newValue  }
    }
    
    public var rotationPeriod: String {
        get { rotationPeriod_nonOptional ?? "Rotation Perdiod Not Found" }
        set { rotationPeriod_nonOptional = newValue  }
    }
    
    public var surfaceWater: String {
        get { surfaceWater_nonOptional ?? "Surface Water Not Found" }
        set { surfaceWater_nonOptional = newValue  }
    }
    
    public var terrain: String {
        get { terrain_nonOptional ?? "Terrain Not Found" }
        set { terrain_nonOptional = newValue  }
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
                Logger.coredata.error("Failed to decode films: \(error.localizedDescription)")
                return []
            }
            
        }
        set {
            do {
                let filmUrls = try JSONEncoder().encode(newValue)
                films_nonOptional = filmUrls
            } catch {
                Logger.coredata.error("Failed to encode films: \(error.localizedDescription)")
            }
        }
    }
    
    public var residents: [String] {
        get {
            guard let data = residents_nonOptional else { return [] }
            do {
                return try JSONDecoder().decode([String].self, from: data)
            } catch {
                Logger.coredata.error("Failed to decode residents: \(error.localizedDescription)")
                return []
            }
            
        }
        set {
            do {
                let residentUrls = try JSONEncoder().encode(newValue)
                residents_nonOptional = residentUrls
            } catch {
                Logger.coredata.error("Failed to encode residents: \(error.localizedDescription)")
            }
        }
    }
}
