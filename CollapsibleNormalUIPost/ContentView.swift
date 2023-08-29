//
//  ContentView.swift
//  CollapsibleNormalUIPost
//
//  Created by Appaiah on 29/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionViewVisible: Bool = false
    var body: some View {
        VStack(spacing: -20) {
            CustomCollapsible(indicatorImg: "eye", title: "Step one",descriptText: "Tap on Step one to open Step two" ,visibleImage: "eye",collapseImage: "eye.slash")
            CustomCollapsible(indicatorImg: "lightbulb.fill", title: "Step two",descriptText: "Tap on Step two to open Step one" ,visibleImage: "lightbulb.fill", collapseImage: "lightbulb.slash")
        }
    }
}

struct CustomCollapsible: View {
    @State var descriptionViewVisible: Bool = false
    @State var indicatorImg: String
    var title: String
    var descriptText: String
    var visibleImage: String {
        didSet {
            indicatorImg = visibleImage
        }
    }
    var collapseImage: String
    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                Image(systemName: indicatorImg)
                    .foregroundColor(Color(.red))
            }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .contentShape(Rectangle())
                .onTapGesture {
                    descriptionViewVisible = descriptionViewVisible ? false : true
                    indicatorImg = descriptionViewVisible ? collapseImage : visibleImage
                }
            if descriptionViewVisible {
                Text(descriptText)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .background(Color(.green).opacity(0.3))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
