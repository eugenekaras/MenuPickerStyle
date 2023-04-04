//
//  ContentView.swift
//  MinuPickerStyle
//
//  Created by Евгений Карась on 3.04.23.
//

import SwiftUI

enum Period: Int, CaseIterable {
    case today = 0
    case thisWeek
    case lastWeek
    case thisMonth
    case lastMonth
    case thisYear
    case lifetime
    
    var name: LocalizedStringKey {
        switch self {
        case .today: return "today"
        case .thisWeek: return "this_week"
        case .lastWeek: return "last_week"
        case .thisMonth: return "this_month"
        case .lastMonth: return "last_month"
        case .thisYear: return "this_year"
        case .lifetime: return "Lifetime"
        }
    }
}
struct ContentView: View {
    @State var period: Period = .today
    
    var body: some View {
        VStack {
            Menu {
                ForEach(Period.allCases, id:\.self) { item in
                    Button {
                        period = item
                    } label: {
                        Text(item.name)
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "calendar.badge.clock")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 29, height: 26)
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Text(period.name)
                    
                    Spacer()
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 11, height: 8)
                        .padding(.trailing, 16)
                }
            }
            .tint(.black)
            .frame(width: 202, height: 47)
            .background(Color.gray)
            .cornerRadius(18)
            
 
        }
        .padding()
    }
}

struct MyMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
      
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
