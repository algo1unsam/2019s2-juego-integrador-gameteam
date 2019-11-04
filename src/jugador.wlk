import wollok.game.*
import direcciones.*

object jugador {
	var property position = game.at(4, 3)
	var direccion = arriba

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
	
	method image() = "jugador.png"
    
    method perder() {
    	game.removeVisual(self)
    	game.addVisual(calavera)
    	game.addVisual(cero)    //en el contadorcontador 0 vidas 
    } 
    
    method perderUnaVida() {
    	vidas -=1
    }
}

