//
//  ContentView.swift
//  Bullseye
//
//  Created by Jakub Žák on 20/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: {
                        game.restartGame()
                        sliderValue = 50.0
                    }, label: {
                        Image(systemName: "gobackward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25, alignment: .center)
                    })
                    Spacer()
                    Button(action: {
                        print("show leader board")
                    }, label: {
                        Image(systemName: "list.number")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(minWidth: 25, maxWidth: 25, minHeight: 25, maxHeight: 25, alignment: .center)
                    })
                }
                
            }
            .padding()
            Spacer()
            Text("Put the bullseye as close as you can to")
                .bold()
                .foregroundColor(.white)
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                    .foregroundColor(.white)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
                    .foregroundColor(.white)
            }
            Button(action: {
                alertIsVisible = true
            }, label: {
                Text("HIT")
                    .bold()
                    .kerning(2.0)
                    .font(.footnote)
                    .colorInvert()
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.orange)
                            .frame(width: 75, height: 30, alignment: .center)
                    )
            })
            .padding()
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert (title: Text("Hello"),
                              message: Text("You scored \(roundedValue), the difference will be added to you penalty!"),
                              dismissButton: Alert.Button.default(
                                Text("OK!"),
                                action: {
                                    game.addScore(sliderValue: roundedValue)
                                    game.nextRound()
                                })
                )
            })
            Spacer()
            VStack {
                HStack {
                    VStack {
                        Text("Penalty")
                            .bold()
                            .foregroundColor(.white)
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                        Text(String(game.score))
                            .bold()
                            .foregroundColor(.white)
                            .padding(1)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray)
                                    .frame(width: 50, height: 30, alignment: .center)
                            )
                    }
                    Spacer()
                    VStack {
                        Text("Round")
                            .bold()
                            .foregroundColor(.white)
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                        Text(String(game.round))
                            .bold()
                            .foregroundColor(.white)
                            .padding(1)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray)
                                    .frame(width: 50, height: 30, alignment: .center)
                            )
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .bottomLeading)
            .padding()
        }
        .padding()
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
