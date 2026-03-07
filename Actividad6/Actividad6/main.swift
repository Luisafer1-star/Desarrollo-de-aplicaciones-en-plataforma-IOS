//
//  main.swift
//  Actividad6
//
//  Created by Luisa Fernanda Hernández Reyes on 06/03/26.
//

import Foundation


// ============================================
// 📩 EJERCICIO 1: Estado de Mensaje
// ============================================


enum MessageStatus : String {
    case enviado = "Enviado"
    case recibido = "Recibido"
    case leido = "Leido"
}

print("\n========================================")
print("ESTADO DEL MENSAJE")
print("========================================\n")


let status: MessageStatus = .enviado
print ("status: \(status)")

switch status {
case .enviado:
    print ("Mensaje enviado")
case .recibido:
    print ("Mensaje recibido")
case.leido:
    print ("Mensaje leído")
}
print ("----------------------------------------")

print (status.rawValue)

// ============================================
// 🧭 EJERCICIO 2: Puntos Cardinales
// ============================================


print("\n========================================")
print("PUNTOS CARDINALES")
print("========================================\n")


enum PuntosCardinales : Int {
    case norte = 1
    case sur
    case este
    case oeste
}

let puntoCardinal : PuntosCardinales = .oeste
print ("puntosCardinal: \(puntoCardinal.rawValue)")


// ============================================
// 📅 EJERCICIO 3: Días de la Semana
// ============================================



print("\n========================================")
print("DÍAS DE LA SEMANA")
print("========================================\n")


enum Dias : Int {
    case lunes = 1
    case martes
    case miercoles
    case jueves
    case viernes
    case sabado
    case domingo
}

func dias(from number : Int) -> Dias? {
    Dias(rawValue: number)
}

var number: Int = 12

if let dia = dias(from: number){
    print ("El día número 3 es el \(dia)")
} else {
    print ("Número de día inválido")
}

print ("----------------------------------------")


// ============================================
// 🚦 EJERCICIO 4: Semáforo
// ============================================


print("\n========================================")
print("SEMÁFORO")
print("========================================\n")


enum Semaforo {
    case red, yellow, green
}

func action(for semaforo: Semaforo) -> String {
    switch semaforo {
    case .red:
        return "🛑 Alto"
    case .yellow:
        return "⚠️ Precaución"
    case .green:
        return "✅ Avanzar"
    }
}

print (action (for: .red))
print (action (for: .yellow))
print (action (for: .green))
print ("----------------------------------------")


// ============================================
// 📦 EJERCICIO 5: Estados de Carga (LoadState)
// ============================================

print("\n========================================")
print("ESTADO DE CARGA")
print("========================================\n")


// Enums con valores asociados
enum LoadState {
    case idle
    case loading
    case success(items: [String])
    case failure(message: String)
}

func render(_ state: LoadState) {
    switch state {
    case .idle:
        print("Listo para buscar")
        
    case .loading:
        print("Cargando...")
        
    case .success(let items):
        print("Resultados: \(items)")
        
    case .failure(let message):
        print("Error: \(message)")
    }
}

render(.idle)
render(.loading)
render(.success(items: ["item 1", "item 2", "item 3"]))
render(.failure(message: "No se pudo cargar"))

print("\n========================================")
print("✨ FIN DEL PROGRAMA")
print("========================================\n")

