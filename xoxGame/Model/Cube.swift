//
//  Model.swift
//  xoxGame
//
//  Created by Furkan on 22.01.2023.
//

import Foundation


class Cube : ObservableObject{
    @Published var content = ""
    var index = 0
}


class ObjectList{
    var cubeList : [Cube]{
        let cube1 = Cube()
        let cube2 = Cube()
        let cube3 = Cube()
        let cube4 = Cube()
        let cube5 = Cube()
        let cube6 = Cube()
        let cube7 = Cube()
        let cube8 = Cube()
        let cube9 = Cube()
        cube1.index = 1
        cube2.index = 2
        cube3.index = 3
        cube4.index = 4
        cube5.index = 5
        cube6.index = 6
        cube7.index = 7
        cube8.index = 8
        cube9.index = 9
        return [cube1,cube2,cube3,cube4,cube5,cube6,cube7,cube8,cube9]
    }
}
