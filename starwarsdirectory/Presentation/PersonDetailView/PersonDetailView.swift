//
//  PersonDetailView.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//
import SwiftUI

struct PersonDetailView: View {
    
    let person: PersonResponse
    
    var body: some View {
        List {
            Section(header: Text("Details")) {
                DataView(title: "Name", data: String(person.name))
                DataView(title: "Height", data: String(person.height))
                DataView(title: "Mass", data: String(person.mass))
                DataView(title: "Hair Color", data: String(person.hairColor))
                DataView(title: "Skin Color", data: String(person.skinColor))
                DataView(title: "Birth Year", data: String(person.birthYear))
                DataView(title: "Gender", data: String(person.gender))
                DataView(title: "Homeworld", data: String(person.homeworld))
            }
        }
        .navigationTitle(person.name)
    }
}

#Preview {
    NavigationStack {
        PersonDetailView(person: PersonResponse.preview(
            name: "Luke Skywalker",
            url: "https://www.swapi.com/api/people/1"))
    }
    
}
