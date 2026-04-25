//
//  main.swift
//  CampusControl
//
//  Created by Luisa Fernanda Hernández Reyes on 22/04/26.
//

import Foundation

// MARK: - ENUMS

enum NivelCurso: String {
    case basico = "Básico"
    case intermedio = "Intermedio"
    case avanzado = "Avanzado"
}

enum EstadoAcademico: String {
    case reprobado = "Reprobado"
    case aprobado = "Aprobado"
    case excelente = "Excelente"
}

// MARK: - STRUCT ESTUDIANTE

struct Student {
    let id: Int
    let name: String
    let age: Int
    let email: String
    
    init?(id: Int, name: String, age: Int, email: String) {
        guard !name.isEmpty else {
            print("Error: El nombre no puede estar vacío.")
            return nil
        }
        
        guard age >= 16 else {
            print("Error: La edad debe ser mayor o igual a 16.")
            return nil
        }
        
        guard email.contains("@") else {
            print("Error: El correo debe contener '@'.")
            return nil
        }
        
        self.id = id
        self.name = name
        self.age = age
        self.email = email
    }
}

// MARK: - CLASS CURSO

class Curso {
    let codigo: String
    let nombre: String
    let nivel: NivelCurso
    let cupoMaximo: Int
    var inscritos: [Student] = []
    
    init(codigo: String, nombre: String, nivel: NivelCurso, cupoMaximo: Int) {
        self.codigo = codigo
        self.nombre = nombre
        self.nivel = nivel
        self.cupoMaximo = cupoMaximo
    }
    
    func inscribir(student: Student) -> Bool {
        if inscritos.count >= cupoMaximo {
            print("Error: No hay cupo disponible en \(nombre).")
            return false
        }
        
        if inscritos.contains(where: { $0.id == student.id }) {
            print("Error: \(student.name) ya está inscrito en \(nombre).")
            return false
        }
        
        inscritos.append(student)
        return true
    }
}

// MARK: - CLASS INSCRIPCION

class Inscripcion {
    let estudiante: Student
    let curso: Curso
    var calificaciones: [Double] = []
    
    init(estudiante: Student, curso: Curso) {
        self.estudiante = estudiante
        self.curso = curso
    }
    
    func agregarCalificacion(_ calificacion: Double) {
        guard calificacion >= 0 && calificacion <= 10 else {
            print("Error: La calificación \(calificacion) no es válida.")
            return
        }
        
        calificaciones.append(calificacion)
        print("Calificación \(calificacion) agregada a \(estudiante.name).")
    }
    
    // Propiedad computada
    var average: Double {
        guard !calificaciones.isEmpty else { return 0.0 }
        let suma = calificaciones.reduce(0, +)
        return suma / Double(calificaciones.count)
    }
    
    // Propiedad computada
    var estado: EstadoAcademico {
        switch average {
        case 0..<6:
            return .reprobado
        case 6..<9:
            return .aprobado
        default:
            return .excelente
        }
    }
}

// MARK: - CLASS PRINCIPAL

class CampusSystem {
    var estudiantes: [Int: Student] = [:]
    var cursos: [String: Curso] = [:]
    var inscripciones: [Inscripcion] = []
    
    func registrarEstudiante(_ estudiante: Student) {
        if estudiantes[estudiante.id] != nil {
            print("Error: Ya existe un estudiante con ese ID.")
            return
        }
        
        estudiantes[estudiante.id] = estudiante
        print("Estudiante \(estudiante.name) agregado correctamente.")
    }
    
    func registrarCurso(_ curso: Curso) {
        if cursos[curso.codigo] != nil {
            print("Error: Ya existe un curso con ese código.")
            return
        }
        
        cursos[curso.codigo] = curso
        print("Curso \(curso.nombre) agregado correctamente.")
    }
    
    func inscribirEstudiante(idEstudiante: Int, codigoCurso: String) {
        guard let estudiante = estudiantes[idEstudiante] else {
            print("Error: Estudiante no encontrado.")
            return
        }
        
        guard let curso = cursos[codigoCurso] else {
            print("Error: Curso no encontrado.")
            return
        }
        
        if curso.inscribir(student: estudiante) {
            let nuevaInscripcion = Inscripcion(estudiante: estudiante, curso: curso)
            inscripciones.append(nuevaInscripcion)
            print("Inscripción realizada correctamente.")
        }
    }
    
    func agregarCalificacion(idEstudiante: Int, codigoCurso: String, calificacion: Double) {
        guard let inscripcion = inscripciones.first(where: {
            $0.estudiante.id == idEstudiante && $0.curso.codigo == codigoCurso
        }) else {
            print("Error: Inscripción no encontrada.")
            return
        }
        
        inscripcion.agregarCalificacion(calificacion)
    }
    
    func mostrarReporteFinal() {
        print("\n=== REPORTE FINAL ===")
        
        for inscripcion in inscripciones {
            print("Estudiante: \(inscripcion.estudiante.name)")
            print("Curso: \(inscripcion.curso.nombre)")
            print("Nivel: \(inscripcion.curso.nivel.rawValue)")
            print("Calificaciones: \(inscripcion.calificaciones)")
            print("Promedio: \(String(format: "%.2f", inscripcion.average))")
            print("Estado: \(inscripcion.estado.rawValue)")
            print("----------------------")
        }
    }
}

// MARK: - PRUEBAS

let sistema = CampusSystem()

if let estudiante1 = Student(id: 1, name: "Luisa", age: 20, email: "luisa@gmail.com") {
    sistema.registrarEstudiante(estudiante1)
}

if let estudiante2 = Student(id: 2, name: "Ana", age: 18, email: "ana@gmail.com") {
    sistema.registrarEstudiante(estudiante2)
}

if let estudiante3 = Student(id: 3, name: "Carlos", age: 22, email: "carlos@gmail.com") {
    sistema.registrarEstudiante(estudiante3)
}

let curso1 = Curso(codigo: "SW001", nombre: "Swift Básico", nivel: .basico, cupoMaximo: 2)
sistema.registrarCurso(curso1)

sistema.inscribirEstudiante(idEstudiante: 1, codigoCurso: "SW001")
sistema.inscribirEstudiante(idEstudiante: 2, codigoCurso: "SW001")
sistema.inscribirEstudiante(idEstudiante: 3, codigoCurso: "SW001") // No hay cupo

sistema.agregarCalificacion(idEstudiante: 1, codigoCurso: "SW001", calificacion: 9.5)
sistema.agregarCalificacion(idEstudiante: 1, codigoCurso: "SW001", calificacion: 8.0)

sistema.agregarCalificacion(idEstudiante: 2, codigoCurso: "SW001", calificacion: 5.5)
sistema.agregarCalificacion(idEstudiante: 2, codigoCurso: "SW001", calificacion: 6.0)

sistema.mostrarReporteFinal()
