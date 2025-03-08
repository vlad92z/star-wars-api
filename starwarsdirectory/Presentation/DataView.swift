//
//  DataView.swift
//  starwarsdirectory
//
//  Created by Vlad on 04/03/2025.
//
import SwiftUI

struct DataView: View {
    
    let title: String
    let data: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(data)
                .foregroundStyle(.secondary)
        }

    }
}

#Preview {
    List {
        Section {
            DataView(title: "Size", data: "12867")
        }
    }
}
