import SwiftUI

struct ContentView: View {
    
    // Estados
    @State private var showAlert = false
    @State private var isEnabled = false
    @State private var valor: Double = 50
    
    // Variables
    let nombre = "Luisa"
    let edad = 20
    
    let experiencia = [
        "Diseño de página web en Figma",
        "App de planificador de proyectos en Android Studio",
        "App de productos del anime Beyblade X en Android Studio"
    ]
    
    let formacion = [
        "Licenciatura en Ingeniería en Software",
        "Curso de Java",
        "Curso de C#",
        "Curso de Python",
        "Certificado de Figma",
        "Certificado de AWS Amazon Data Engineering",
        "Curso de Unity Learn"
    ]
    
    let contacto: (email: String, telefono: String) =
    ("luisafer21052005@gmail.com", "56 1148 2615")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Foto + nombre
                VStack(alignment: .center) {
                    Image("perfil")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                        .shadow(radius: 5)
                    
                    Text(nombre)
                        .font(.title)
                        .bold()
                    
                    Text("Edad: \(edad)")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                // Contacto
                VStack(alignment: .leading, spacing: 6) {
                    Text("Contacto")
                        .font(.headline)
                    
                    Text(contacto.email)
                    Text(contacto.telefono)
                }
                
                Divider()
                
                // Experiencia
                VStack(alignment: .leading, spacing: 6) {
                    Text("Experiencia Profesional")
                        .font(.headline)
                    
                    ForEach(experiencia, id: \.self) { proyecto in
                        Text("• \(proyecto)")
                    }
                }
                
                Divider()
                
                // Formación
                VStack(alignment: .leading, spacing: 6) {
                    Text("Formación Académica")
                        .font(.headline)
                    
                    ForEach(formacion, id: \.self) { estudio in
                        Text("• \(estudio)")
                    }
                }
                
                Divider()
                
                // Botón
                Button("Cursos") {
                    showAlert = true
                }
                .alert("Cursos en 2025", isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("""
                    Big Data
                    Computer Vision
                    Data Science
                    """)
                }
                
                // Toggle
                VStack(alignment: .leading) {
                    Toggle("Perfil", isOn: $isEnabled)
                    
                    Text(isEnabled ? "Developer" : "Scrum Master")
                        .foregroundColor(isEnabled ? .green : .red)
                }
                
                // Slider
                VStack(alignment: .leading) {
                    Text("Nivel: \(Int(valor))")
                    Slider(value: $valor, in: 0...100, step: 1)
                }
            }
            .padding()
        }
    }
}
