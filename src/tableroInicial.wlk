import wollok.game.*
import bolitas.*
import pared.*
import jugador.*

object tablero {

	var property bolitas = []
	var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]
	var cantBolitasColorJugador = 0

	method crearBolitas(unaCantidadDeBolitas) {
		times
		(unaCantidadDeBolitas)
		{ self.crearBolita()}
	}

	method crearBolita() {
		var colorElegido = colores.anyOne()
		var velX = 0.randomUpTo((game.width())).roundUp()
		var velY = 0.randomUpTo((game.width())).roundUp()
		var bolita = new Bolita(color = colorElegido, velocidadEnX = velX, velocidadEnY = velY)
		game.addVisual(bolita)
		bolitas.add(bolita)
	}

	method contarCuantasBolitasSonColorJugador() {
		bolitas.forEach({ bolita =>
			if (bolita.color() == jugador.colorJugador()) cantBolitasColorJugador += 1
		})
	}
	
	method eliminarBolitaColorJugador() {
		cantBolitasColorJugador += -1
	}

// PAREDES
/*method cargar() {
 * 	const ancho = game.width() - 1
 * 	const largo = game.height() - 1
 * 	var posParedes = []
 * 	(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = 0))} // bordeAbajo
 * 	(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = largo))} // bordeArriba 
 * 	(0 .. largo).forEach{ n => posParedes.add(new Position(x = 0, y = n))} // bordeIzq 
 * 	(0 .. largo).forEach{ n => posParedes.add(new Position(x = ancho, y = n))} // bordeDer
 * 	posParedes.forEach{ p => self.dibujar(new Pared(position = p))}
 * }

 * method dibujar(dibujo) {
 * 	game.addVisual(dibujo)
 * 	return dibujo
 }*/
}

