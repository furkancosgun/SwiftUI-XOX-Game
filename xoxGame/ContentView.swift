//
//  ContentView.swift
//  xoxGame
//
//  Created by Furkan on 22.01.2023.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State var select = false
    @State var finished = false
    var cubeList : [Cube]
    
    init() {
        cubeList = ObjectList().cubeList
    }

    var body: some View {
        VStack {
            HStack{
                
                Button{
                    refreshPanel()
                }label: {
                    HStack{
                        Image(systemName:"arrow.counterclockwise")
                        Text("REFRESH")
                    }
                    
                }
                Spacer()
                Button{
                    checkFinished()
                }label: {
                    Image(systemName: "checkmark.seal.fill")
                    Text("CHECK")
                }
                    
            }
            .bold().foregroundColor(colorScheme == .dark ? .white : .black).padding()
            Spacer()
            
            HStack{
                Text("P1: O")
                Spacer()
                Image(systemName: select ?  "arrowshape.right" : "arrowshape.left")
                Spacer()
                Text("P2 : X")
            }.padding()
                .font(.largeTitle).bold()
            HStack{
                CubeView(selected: $select, cube: cubeList[0])
                CubeView(selected: $select, cube: cubeList[1])
                CubeView(selected: $select, cube: cubeList[2])
            }
            HStack{
                CubeView(selected: $select, cube: cubeList[3])
                CubeView(selected: $select, cube: cubeList[4])
                CubeView(selected: $select, cube: cubeList[5])
            }
            HStack{
                CubeView(selected: $select, cube: cubeList[6])
                CubeView(selected: $select, cube: cubeList[7])
                CubeView(selected: $select, cube: cubeList[8])
            }

            Spacer()
        }
        .sheet(isPresented: $finished){
            VStack{
                VStack{
                    Image(systemName: "star.fill")
                    Text(select ? "O Person Winned" : "X Person Winned")
                }.bold().font(.largeTitle)
            }
        }
        
        .padding()
    }
    func refreshPanel(){
        self.cubeList.map { cube in
            cube.content = ""
        }
    }
    
    func checkFinished() {
        /*
         x o x
         x o x
         x o x
         */
        if(cubeList[0].content == "X" && cubeList[1].content == "O" && cubeList[2].content == "X" || cubeList[3].content == "X" && cubeList[4].content == "O" && cubeList[5].content == "X" || cubeList[6].content == "X" && cubeList[7].content == "O" && cubeList[8].content == "X"){
            finished = true
        }
        /*
         x  x
           o
         x  x
         */
        if((cubeList[0].content == "X" && cubeList[8].content == "X" || cubeList[6].content == "X" && cubeList[2].content == "X" ) && cubeList[4].content == "O"){
            finished = true
        }
        /*
         x  x  x
         o  o  o
         x  x  x
         */
        
        if((
            cubeList[0].content == "X" && cubeList[6].content == "X" ||
            cubeList[2].content == "X" && cubeList[8].content == "X" ||
            cubeList[1].content == "X" && cubeList[7].content == "X"
           ) && (cubeList[3].content == "O" || cubeList[4].content == "O" || cubeList[5].content == "O") ){
            finished = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
