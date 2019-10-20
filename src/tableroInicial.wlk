import wollok.game.*
import bolitas.*

object tablero {
	var property bolitas = []
	var property colores = ["amarilla", "roja", "azul", "naranja", "lila", "verde"]

	
	method crearBolitas(unaCantidadDeBolitas) {
		var cantBolitasCreadas = 0
		if(cantBolitasCreadas < unaCantidadDeBolitas) { 
			//self.crearBolita()
			game.addVisual(new Bolita(color = self.eligeColor(), velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelY()))
			cantBolitasCreadas += 1}
	}
	
	/*method crearBolita() {
		var bolita = new Bolita(color = self.eligeColor(), velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelY())
	}*/
	
	method eligeColor() {
		return colores.anyOne()
	}
	
	method determinaVelX() {
		return 0.randomUpTo((game.width())).roundUp() 
	}
	
	method determinaVelY() {
		return 0.randomUpTo((game.height())).roundUp()  
	}
	
	method crearJugador() {
		var jugador = new Jugador(color = self.eligeColor())
	}
	
}
