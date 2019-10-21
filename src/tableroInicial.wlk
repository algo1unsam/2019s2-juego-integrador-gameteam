import wollok.game.*
import bolitas.*
import pared.*
import jugador.*

object tablero {

	//var property bolitas = []
	//var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]

	/* 	method crearBolitas(unaCantidadDeBolitas) {
	 * 		var cantBolitasCreadas = 0
	 * 		if(cantBolitasCreadas < unaCantidadDeBolitas) { 
	 * 			//self.crearBolita()
	 * 			game.addVisual(new Bolita(color = self.eligeColor(), velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelY()))
	 * 			cantBolitasCreadas += 1}
	 } */
	method crearBolita() {
	 	game.addVisual( new Bolita(/*color = self.eligeColor(),*/ velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelY()))
	 }
	// PAREDES
	/*method cargar() {
		const ancho = game.width() - 1
		const largo = game.height() - 1
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = largo))} // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x = 0, y = n))} // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x = ancho, y = n))} // bordeDer
		posParedes.forEach{ p => self.dibujar(new Pared(position = p))}
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}*/
	

/* 	method eligeColor() {
		return colores.anyOne()
	}*/

	method determinaVelX() {
		return 0.randomUpTo((game.width())).roundUp()
	}

	method determinaVelY() {
		return 0.randomUpTo((game.height())).roundUp()
	}

// jugador
// method crearJugador() {
// var jugador = new Jugador(color = self.eligeColor())
// }
}
