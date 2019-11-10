

import wollok.game.*
//import direcciones.*

/*object jugador {

	var property colorJugador = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ].anyOne()
	var property position = game.at(4, 3)
	var property vidas = 3
	var direccion = arriba

	method image() = "jugador" + colorJugador + ".png"

	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			console.println(e)
			self.retrocede()
		}
	}

	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}

	method retrocedeCon(caja) {
		self.retrocede()
		caja.movete(direccion.opuesto())
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

	method perder() {
		game.removeVisual(self)
		game.addVisual(calavera)
		game.addVisual(cero) // en el contador 0 vidas 
	}

	method perderUnaVida() {
		vidas -= 1
	}

}

object jugadorGanador{
	
	method image() = "jugadorGanador.png"
} */
