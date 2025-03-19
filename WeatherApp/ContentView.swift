//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nirusan Manoharan on 2025-03-18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            backgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack{
                cityTextview(cityName: "New York, NY")
                
                mainWeatherStatusView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temperature: isNight ? "6°" : "27°")
                
                HStack (spacing:20){
                    WeatherForecast(dayOfWeek: "TUE", imageName: "wind", temperature: "2°")
                    WeatherForecast(dayOfWeek: "WED", imageName: "cloud.bolt.fill", temperature: "10°")
                    WeatherForecast(dayOfWeek: "THU", imageName: "cloud.drizzle.fill", temperature: "12°")
                    WeatherForecast(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: "43°")
                    WeatherForecast(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: "52°")
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    buttonClick(title: "Change Day time", textColor: isNight ? .white : .blue, backgroundColor: isNight ? .black : .white)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherForecast: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(temperature)
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct backgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityTextview: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct mainWeatherStatusView: View {
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(temperature)
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

struct buttonClick: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
