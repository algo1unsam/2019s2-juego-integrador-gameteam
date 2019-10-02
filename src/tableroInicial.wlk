import wollok.game.*
import bolitas.*

object tablero {
	var property bolitas = []
	var property colores = ["amarilla", "roja", "azul", "naranja", "lila", "verde"]

	
	method crearBolitas(unaCantidadDeBolitas) {
		
	}
	
	method crearBolita() {
		var bolita = new Bolita(color = self.eligeColor(), velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelX())
	}
	
	method eligeColor() {
		return colores.anyOne()
	}
	
	method determinaVelX() {
		return 0.randomUpTo((game.width()))
	}
	
	method determinaVelY() {
		return 0.randomUpTo((game.height()))
	}
	
	method crearJugador() {
		var jugador = new Jugador(color = self.eligeColor())
	}
	
}
