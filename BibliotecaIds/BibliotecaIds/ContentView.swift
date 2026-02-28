//
//  ContentView.swift
//  BibliotecaIds
//
//  Created by Luisa Fernanda Hernández Reyes on 11/02/26.
//

import SwiftUI

struct Libro: Identifiable {
    let id = UUID()
    let titulo: String
    let autor: String
    let anio: String
    let imagen: String
}

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let libros = [
        Libro(titulo: "Clean Architecture", autor: "Robert C. Martin", anio: "2017", imagen: "Libro 1"),
        Libro(titulo: "Code Complete", autor: "Steve McConnell", anio: "2004", imagen: "Libro 2"),
        Libro(titulo: "Design Patterns", autor: "Gamma, Helm, Johnson y Vlissides", anio: "1994", imagen: "Libro 3"),
        Libro(titulo: "The Pragmatic Programmer", autor: "Andrew Hunt y David Thomas", anio: "1999", imagen: "Libro 4"),
        Libro(titulo: "Object-Oriented Software Construction", autor: "Bertrand Meyer", anio: "1988", imagen: "Libro 5"),
        Libro(titulo: "Clean Code", autor: "Robert C. Martin", anio: "2008", imagen: "Libro 6"),
        Libro(titulo: "Software Engineering at Google", autor: "Titus Winters, Tom Manshreck y Hyrum Wright", anio: "2020", imagen: "Libro 7"),
        Libro(titulo: "Head First Design Patterns", autor: "Eric Freeman & Elisabeth Robson", anio: "2004", imagen: "Libro 8"),
        Libro(titulo: "Fundamentos de la arquitectura de software", autor: "Mark Richards y Neal Ford", anio: "2020", imagen: "Libro 9"),
        Libro(titulo: "Systems Analysis and Design", autor: "Dennis, Wixom y Roth", anio: "2015", imagen: "Libro 10"),
        Libro(titulo: "Domain-Driven Design", autor: "Eric Evans", anio: "2003", imagen: "Libro 11")
    ]
    
    var body: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            
            ScrollView {
                if horizontalSizeClass == .compact {
                    
                    // Vertical (iPhone portrait)
                    VStack(spacing: 20) {
                        ForEach(libros) { libro in
                            LibroView(libro: libro)
                        }
                    }
                    
                } else {
                    
                    // Horizontal (iPad o landscape)
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(libros) { libro in
                            LibroView(libro: libro)
                        }
                    }
                }
            }
        }
    }
}

struct LibroView: View {
    let libro: Libro
    
    var body: some View {
        HStack {
            Image(libro.imagen)
                .resizable()
                .frame(width: 100, height: 130)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(libro.titulo)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("Autor: \(libro.autor)")
                    .bold()
                    .foregroundColor(.white)
                
                Text("Año de publicación: \(libro.anio)")
                    .italic()
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.2))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
