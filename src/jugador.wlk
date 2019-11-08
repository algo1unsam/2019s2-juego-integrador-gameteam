import wollok.game.*
import direcciones.*
import bolitas.*

object jugador {

	var property position = game.at(4, 3)
	var direccion = arriba

	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	


	method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}

method empuja(e) {
	
		e.desaparece()
	}
	method image() = "jugador.png"
//	method position() = position
//	method position(_position) {
//		position = _position
//	} 
}

