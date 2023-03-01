//
//  SmallAđButton.swift
//  ToDoAppDemo
//
//  Created by Newwave on 01/03/2023.
//

import SwiftUI

struct SmallA_Button: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct SmallA_Button_Previews: PreviewProvider {
    static var previews: some View {
        SmallA_Button()
    }
}
