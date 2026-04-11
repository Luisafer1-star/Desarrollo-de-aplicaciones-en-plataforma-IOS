//
//  main.swift
//  UserManager
//
//  Created by Luisa Fernanda Hernández Reyes on 11/04/26.
//

import Foundation

func separador(titulo: String) {
    print("\n==================== \(titulo) ====================\n")
}

// MARK: - Clase base: Usuario
class Usuario {
    
    var nombre: String
    var email: String
    private var password: String
    private(set) var activo: Bool
    
    init(nombre: String, email: String, password: String, activo: Bool = true) {
        self.nombre = nombre
        self.email = email
        self.password = password
        self.activo = activo
    }
    
    convenience init() {
        self.init(nombre: "Invitado", email: "sin_email", password: "123456", activo: true)
    }
    
    func login(password: String) -> Bool {
        return self.password == password && activo
    }
    
    func cambiarPassword(actual: String, nueva: String) -> Bool {
        if self.password == actual && nueva.count >= 6 {
            self.password = nueva
            return true
        }
        return false
    }
    
    func activar() {
        activo = true
    }
    
    func desactivar() {
        activo = false
    }
    
    func descripcion() {
        print("""
        -------- Usuario --------
        Nombre: \(nombre)
        Email: \(email)
        Activo: \(activo)
        -------------------------
        """)
    }
    
    internal func _setPassword(_ nueva: String) {
        if nueva.count >= 6 {
            self.password = nueva
        }
    }
}

// MARK: - Subclase: Administrador
class Administrador: Usuario {
    
    var nivelAcceso: Int
    
    init(nombre: String, email: String, password: String, nivelAcceso: Int) {
        self.nivelAcceso = nivelAcceso
        super.init(nombre: nombre, email: email, password: password)
    }
    
    override func descripcion() {
        print("""
        ----- Administrador -----
        Nombre: \(nombre)
        Email: \(email)
        Nivel de acceso: \(nivelAcceso)
        Activo: \(activo)
        -------------------------
        """)
    }
    
    func eliminarUsuario(_ usuario: Usuario) {
        if nivelAcceso >= 5 {
            usuario.desactivar()
            print("✔ Usuario desactivado correctamente")
        } else {
            print("✖ Nivel de acceso insuficiente")
        }
    }
    
    func resetearPassword(usuario: Usuario, nueva: String) {
        if nivelAcceso >= 5 {
            usuario._setPassword(nueva)
            print("✔ Password reseteada")
        } else {
            print("✖ Nivel de acceso insuficiente")
        }
    }
}

// MARK: - Subclase: Cliente
class Cliente: Usuario {
    
    private var saldo: Double = 0.0
    fileprivate var historialCompras: [String] = []
    
    func depositar(_ cantidad: Double) {
        if cantidad > 0 {
            saldo += cantidad
            print("✔ Depósito: \(cantidad) | Saldo actual: \(saldo)")
        } else {
            print("✖ Cantidad inválida")
        }
    }
    
    func comprar(producto: String, precio: Double) {
        if precio <= saldo {
            saldo -= precio
            historialCompras.append(producto)
            print("✔ Compra: \(producto) | Restante: \(saldo)")
        } else {
            print("✖ Saldo insuficiente")
        }
    }
    
    func verSaldo() -> Double {
        return saldo
    }
    
    override func descripcion() {
        print("""
        -------- Cliente --------
        Nombre: \(nombre)
        Email: \(email)
        Activo: \(activo)
        Saldo: \(saldo)
        -------------------------
        """)
    }
}

// MARK: - Pruebas (main)

separador(titulo: "CREACIÓN DE USUARIO")
let usuario = Usuario(nombre: "Luisa", email: "luisafernandahernandezreyes0@mail.com", password: "123456")
usuario.descripcion()

separador(titulo: "LOGIN")
print("Login correcto:", usuario.login(password: "123456"))

separador(titulo: "CAMBIO DE PASSWORD")
print("Cambio password:", usuario.cambiarPassword(actual: "123456", nueva: "abcdef"))

separador(titulo: "ADMINISTRADOR")
let admin = Administrador(nombre: "Admin", email: "admin@mail.com", password: "admin123", nivelAcceso: 5)
admin.descripcion()

separador(titulo: "ELIMINAR USUARIO")
admin.eliminarUsuario(usuario)
usuario.descripcion()

separador(titulo: "RESETEAR PASSWORD")
admin.resetearPassword(usuario: usuario, nueva: "nueva123")

separador(titulo: "CLIENTE")
let cliente = Cliente(nombre: "Cliente1", email: "cliente@mail.com", password: "cliente123")
cliente.descripcion()

separador(titulo: "OPERACIONES")
cliente.depositar(500)
cliente.comprar(producto: "Audífonos", precio: 200)

print("\nSaldo actual:", cliente.verSaldo())
cliente.descripcion()
