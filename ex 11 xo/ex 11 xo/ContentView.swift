//
//  ContentView.swift
//  ex 11 xo
//
//  Created by bibi on 05/01/2021.
//

import SwiftUI
struct Field {
    var player : String
    var enabled : Bool
}
struct ContentView: View {
    
    @State var fields : [[Field]] = .init(repeating: .init(repeating: Field(player: "",enabled : true), count : 3), count: 3)
    @State var playerTurn : String = "x"
    
    @State var winner = ""
    @State var winstatus = false
    @State var drawcounter = 0
    
    var body: some View {
        
        ZStack{
            Color.gray
                .ignoresSafeArea()
            
        VStack(spacing: 10){
           
            if winstatus == false {
            Text("\(playerTurn) turn")
                .font(.largeTitle)
            }
            else{
                Text(winner)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            ForEach(0 ..< 3) { r in
                HStack(spacing: 10){
                    ForEach(0 ..< 3) { c in
                        
                        Button(action: {
                            if fields [r][c].enabled{
                                
                                fields[r][c].player = playerTurn
                                
                                drawcounter += 1
                                     checkwinner()
                                if winstatus == false {
                                   
                                playerTurn = playerTurn == "x" ? "o" : "x"
                                    fields [r][c].enabled = false
                                }
                                
                                else{
                                    fields [0][0].enabled = false
                                    fields [0][1].enabled = false
                                    fields [0][2].enabled = false
                                    fields [1][0].enabled = false
                                    fields [1][1].enabled = false
                                    fields [1][2].enabled = false
                                    fields [2][0].enabled = false
                                    fields [2][1].enabled = false
                                    fields [2][2].enabled = false
                    
                                }
                            }
                        }, label: {
                            Text(fields [r][c].player)
                                .font(.system(size: 60))
                            //  .foregroundColor(Color( colorLiteral(red:0,green: 0, blue: 0, alpha: 1)))
                                .foregroundColor(.black)                                .frame(width: 90, height: 90, alignment: .center)
                                .background(Color.white)
                            
                            
                        })
                        
                        
                    }
                    
                    
                }
                
            }
            if winner != "" {
                VStack{
                 
                Button(action: {
                    restartG()
                }, label: {
                    Text("Restart")
                        .font(.system(size: 35))
                     
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        
                        
                        .frame(width: 180, height: 40 , alignment: .center)
                        .background(Color.white)
                        .overlay(Rectangle().stroke(Color.black,lineWidth: 3))
                    
                })
                .padding(.top, 20)
            }
            
            
        }
        
        }
        .background(Color("AccentColor"))
        }
        
    }
    
    func checkwinner(){
        let r1 = fields[0][0].player == playerTurn
            &&  fields[0][1].player == playerTurn
            && fields[0][2].player == playerTurn
        
        let r2 = fields[1][0].player == playerTurn
            &&  fields[1][1].player == playerTurn
            && fields[1][2].player == playerTurn

        let r3 = fields[2][0].player == playerTurn
            &&  fields[2][1].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let c1 = fields[0][0].player == playerTurn
            &&  fields[1][0].player == playerTurn
            && fields[2][0].player == playerTurn

        let c2 = fields[0][1].player == playerTurn
            &&  fields[1][1].player == playerTurn
            && fields[2][1].player == playerTurn
        
        let c3 = fields[0][2].player == playerTurn
            &&  fields[1][2].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let d1 = fields[0][0].player == playerTurn
            &&  fields[1][1].player == playerTurn
            && fields[2][2].player == playerTurn
        
        let d2 = fields[2][0].player == playerTurn
            &&  fields[1][1].player == playerTurn
            && fields[0][2].player == playerTurn
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            
            winner = "\(playerTurn) win"
            winstatus = true }
        else if drawcounter == 9 {
         winner = "Draw"
            winstatus = true
            
        }
    }
    
    
    func restartG(){
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 3), count:3)
        playerTurn = "x"
        winner = ""
        winstatus = false
        drawcounter = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
