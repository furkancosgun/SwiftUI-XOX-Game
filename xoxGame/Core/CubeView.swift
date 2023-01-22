//
//  Cube.swift
//  xoxGame
//
//  Created by Furkan on 22.01.2023.
//

import SwiftUI



struct CubeView : View{
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var size = UIScreen.main.bounds.width / 3 - 30
    @Binding var selected : Bool
    @ObservedObject var cube : Cube
    var body : some View {
        if(colorScheme == .dark){
            Color.black
                .frame(width: size,height: size)
                .shadow(color: .white,
                                radius: 1,
                                x: CGFloat(4), y: CGFloat(5))
                .overlay{
                    Text(cube.content.uppercased()).font(.largeTitle).bold()
                }
                .onTapGesture {
                    if (cube.content.isEmpty){
                        cube.content =  selected ?  "X" : "O"
                        selected = !selected
                    }
            }
        }else{
            Color.white
                .frame(width: size,height: size)
                .shadow(color: .black,
                                radius: 1,
                                x: CGFloat(4), y: CGFloat(5))
                .overlay{
                    Text(cube.content.uppercased()).font(.largeTitle).bold()
                }
                .onTapGesture {
                    if (cube.content.isEmpty){
                        cube.content =  selected ?  "X" : "O"
                        selected = !selected
                    }
            }
        }
        
    }
}


