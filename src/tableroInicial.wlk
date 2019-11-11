

import wollok.game.*
import bolitas.*
import pared.*
import jugador.*


/*object tablero {

	var property bolitas = []
	var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]
	var cantBolitasColorJugador = 0

	method crearBolitas(unaCantidadDeBolitas) {
	times
		(unaCantidadDeBolitas)
		{ self.crearBolita()}
	}

	

	method contarCuantasBolitasSonColorJugador() {
		bolitas.forEach({ bolita =>
			if (bolita.color() == jugador.colorJugador()) cantBolitasColorJugador += 1
		})
	}
	
	method eliminarBolitaColorJugador() {
		cantBolitasColorJugador += -1
	}
}

object nivel1 {

	method cargar() {
		
		
		
		
	
 	
		// jugador
		game.addVisual(jugador)
		
		//	TECLADO
		keyboard.up().onPressDo{ jugador.irArriba()}
		keyboard.down().onPressDo{ jugador.irAbajo()}
		keyboard.left().onPressDo{ jugador.irIzquierda()}
		keyboard.right().onPressDo{ jugador.irDerecha()}
		keyboard.r().onPressDo{ self.restart() }
		
		// COLISIÓNES
		//game.whenCollideDo(jugador, { e => jugador.empuja(e) })
		
	}

	method restart() {
		game.clear()
		self.cargar()
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
}*/

object tablero {

	var property bolitas = []
	var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]
	var posParedInferior = []
	var posParedSuperior = []
	var posParedDerecha = []
	var posParedIzquierda = []
	
	
	method crearBolita() {
		
		var bolita = new Bolita(color = colores.anyOne(), velocidadEnX = 0.randomUpTo((game.width()/2)).roundUp(), velocidadEnY =  0.randomUpTo((game.width()/2)).roundUp())
		game.addVisual(bolita)
		bolitas.add(bolita)
	}
	
	method crearBolitaNegra() {
		
		var bolitaNegra = new BolitaNegra(color = "negra", velocidadEnX = 0.randomUpTo(4).roundUp(), velocidadEnY = 0.randomUpTo((4)).roundUp())
		game.addVisual(bolitaNegra)
		bolitas.add(bolitaNegra)
		
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method crearParedes() {
		
		const ancho = game.width() - 1
		const largo = game.height() - 1
		 
		
		
		(0 .. ancho).forEach{ n => posParedInferior.add(new Position(x = n, y = 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posParedSuperior.add(new Position(x = n, y = largo))} // bordeArriba 
		(0 .. largo).forEach{ n => posParedIzquierda.add(new Position(x = 0, y = n))} // bordeIzq 
		(0 .. largo).forEach{ n => posParedDerecha.add(new Position(x = ancho, y = n))} // bordeDer
		posParedInferior.forEach({p => self.dibujar(new ParedInferior(position = p))})
		posParedSuperior.forEach({p => self.dibujar(new ParedSuperior(position = p))})
		posParedIzquierda.forEach({p => self.dibujar(new ParedIzquierda(position = p))})
		posParedDerecha.forEach({p => self.dibujar(new ParedSuperior(position = p))})
		
	}
	
	
	
}

