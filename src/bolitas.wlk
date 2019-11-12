import wollok.game.*
import tableroInicial.*
import jugador.*
import pared.*


/*class Bolita {


 * 	

 * 	method movete(direccion) {
 * 		game.removeVisual(self)
 * 	}

 * 	method desaparecer() {
 * 		game.removeVisual(self)
 * 		tablero.eliminarBolitaColorJugador() // FALTA contador con una menos
 * 		game.addvisual(tablero.getCantBolitasDelColorDelJugador()) // FALTA METODO BIEN en contador de cant de bolitas del color del jugador
 * 		if (tablero.cantBolitasColorJugador() == 0) {
 * 			jugador.position(jugador.position())
 * 			game.addVisual(jugadorGanador)
 * 			game.addVisual(win) // en contador de vidas
 * 		}
 * 	}

 * }

 * 

 */
class Bolita {

	var property posiciones = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]
	// Cada bolita al comenzar el juego tiene un color, elegido entre una lista de colores, aparece en algun lugar del tablero y se mueve en una cierta direccion
	var property color
	var property position = game.at(posiciones.anyOne(), posiciones.anyOne())
	var property velocidadEnX
	var property velocidadEnY

	// segun su color es la imagen correspondiente
	method image() = "bolita" + color + ".png"

	method aparecer() {
		game.addVisual(self)
		game.onCollideDo(self, { objeto =>
			 objeto.interactuarConBolita(self)
		})
	}

	method interactuarConJugador() {
		if (self.color() == jugador.colorJugador()) {self.desaparecer()
			game.say(jugador, "Super")
		}
	}

	// Moverse implica cambiar posicion
	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}

	// Genera movimiento horizontal
	method moverseSegunVelocidadX() {
		self.moverseHacia(self.position().right(velocidadEnX))
	}

	// Genera movimiento vertical
	method moverseSegunVelocidadY() {
		self.moverseHacia(self.position().up(velocidadEnY))
	}

	// cambia sentido del movimiento horizontal
	method invertirVelocidadX() {
		velocidadEnX *= -1
	// self.moverseHacia(self.position().left(1))
	}

	// cambia sentido del movimiento vertical
	method invertirVelocidadY() {
		velocidadEnY *= -1
	// self.moverseHacia(self.position().down(1))
	}
	
	method interactuarConBolita(bolita) {
		self.invertirVelocidadX()
		self.invertirVelocidadY()
	}

	method desaparecer() {
		
		tablero.eliminar(self)
		//tablero.cantBolitasColorJugador(tablero.cantBolitasColorJugador() - 1)
	}

}

class BolitaNegra inherits Bolita {

	var property peligrosidad = 0

	override method image() = "bolitanegra" + peligrosidad.toString() + ".png"

	override method invertirVelocidadX() {
		velocidadEnX *= -1
		if (peligrosidad < 8) peligrosidad += 1
	}

	override method invertirVelocidadY() {
		velocidadEnY *= -1
		if (peligrosidad < 8) peligrosidad += 1
	}

	override method interactuarConJugador() {
		if (peligrosidad == 9) jugador.perder() else jugador.perderUnaVida()
	}

}

