import wollok.game.*
import tableroInicial.*
class Bolita {

	var property color
	var property position = game.center()
	var property velocidadEnX
	var property velocidadEnY

	method image() = "bolita" + color + ".png" 

	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}

	method velocidadX() {
		self.moverseHacia(self.position().right(velocidadEnX))
	}
	
	method invertirVelocidadX() {
		velocidadEnX *= -1
	}
	
	method invertirVelocidadY() {
		velocidadEnY *= -1
	}

	method velocidadY() {
		self.moverseHacia(self.position().up(velocidadEnY))
	}

	method movete(direccion) {
		game.removeVisual(self)
	}
	
	method desaparecer() {
		game.removeVisual(self)
		tablero.cantBolitasDelColorDelJugador(bolitasrestantes -=1) // restar una bolita y mostrar el contador con una menos
		game.addvisual(tablero.getCantBolitasDelColorDelJugador()) //en contador de cant de bolitas del color del jugador
		if (tablero.cantBolitasDelColorDelJugador == 0) {
			game.addVisual(jugadorGanador)
			game.addVisual(win) // en contador de vidas
												
		}
	}

}

class BolitaNegra inherits Bolita {
	var property peligrosidad = 0
	
	method image() = "bolitaNegra" + peligrosidad.toString() + ".png"
 	
	override invertirVelocidadX() {
		
		velocidadEnX *= -2
	
	}
	
	override invertirVelocidadY() {
		
		velocidadEnY *= -2
	
	}
}

