//
//  ContentView.swift
//  resume
//
//  Created by Luisa Fernanda Hernández Rey on 21/01/26.
//


import SwiftUI

struct ContentView: View {
    // Variables
    var nombre = "Luisa"
    var edad = 20
    
    // Arreglos
    var experiencia = [
        "Diseño de página web en Figma",
        "App de planificador de proyectos en Android Studio",
        "App de productos del anime Beyblade X en Android Studio"
    ]
    
    var formacion = [
        "Licenciatura en Ingeniería en Software",
        "Curso de Java",
        "Curso de C#",
        "Curso de Python",
        "Certificado de Figma",
        "Certificado de AWS Amazon Data Engineering",
        "Curso de Unity Learn"
    ]
    
    // Tupla ejemplo
    let contacto: (email: String, telefono: String) = ("luisafer21052005@gmail.com", "56 1148 2615")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Imagen
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundStyle(.tint)
                .padding(.bottom, 10)
            
            // Datos personales
            Text("Nombre: \(nombre)")
                .font(.title2)
                .bold()
            Text("Edad: \(edad)")
                .font(.subheadline)
            Text("Contacto: \(contacto.email), \(contacto.telefono)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            // Experiencia profesional
            Text("Experiencia Profesional:")
                .font(.headline)
            ForEach(experiencia, id: \.self) { proyecto in
                Text("• \(proyecto)")
            }
            
            // Formación académica
            Text("Formación Académica:")
                .font(.headline)
                .padding(.top, 10)
            ForEach(formacion, id: \.self) { estudio in
                Text("• \(estudio)")
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
