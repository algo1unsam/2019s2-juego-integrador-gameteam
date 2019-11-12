import wollok.game.*
import bolitas.*
import pared.*
import jugador.*

/*object tablero {

 * 	var property bolitas = []
 * 	var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]
 * 	var cantBolitasColorJugador = 0

 * 	method crearBolitas(unaCantidadDeBolitas) {
 * 	times
 * 		(unaCantidadDeBolitas)
 * 		{ self.crearBolita()}
 * 	}

 * 	

 * 	method contarCuantasBolitasSonColorJugador() {
 * 		bolitas.forEach({ bolita =>
 * 			if (bolita.color() == jugador.colorJugador()) cantBolitasColorJugador += 1
 * 		})
 * 	}
 * 	
 * 	method eliminarBolitaColorJugador() {
 * 		cantBolitasColorJugador += -1
 * 	}
 * }

 * object nivel1 {

 * 	method cargar() {
 * 		
 * 		
 * 		
 * 		
 * 	
 *  	
 * 		// jugador
 * 		game.addVisual(jugador)
 * 		
 * 		//	TECLADO
 * 		keyboard.up().onPressDo{ jugador.irArriba()}
 * 		keyboard.down().onPressDo{ jugador.irAbajo()}
 * 		keyboard.left().onPressDo{ jugador.irIzquierda()}
 * 		keyboard.right().onPressDo{ jugador.irDerecha()}
 * 		keyboard.r().onPressDo{ self.restart() }
 * 		
 * 		// COLISIÓNES
 * 		//game.whenCollideDo(jugador, { e => jugador.empuja(e) })
 * 		
 * 	}

 * 	method restart() {
 * 		game.clear()
 * 		self.cargar()
 * 	}

 * 	method dibujar(dibujo) {
 * 		game.addVisual(dibujo)
 * 		return dibujo
 * 	}
 }*/
object tablero {

	var property bolitas = []
	var property colores = [ "amarilla", "roja", "azul", "naranja", "lila", "verde" ]
	var velocidadesPosibles = [ 1, -1 ]
	var posParedInferior = []
	var posParedSuperior = []
	var posParedDerecha = []
	var posParedIzquierda = []
	var property estadoActual = menuPrincipal
	var property cantBolitasColorJugador = self.cuentaBolitasColorJugador()

	method quitarVisual() {
		game.allVisuals().forEach{ visuales => game.removeVisual(visuales)}
	}

	method cargar() {
		self.quitarVisual()
		self.crearBolita()
		self.crearParedes()
		game.sound("fondo.ogg")
		game.onTick(100, "movimientoBolita", { self.bolitas().forEach({ bolita =>
			bolita.moverseSegunVelocidadX()
			bolita.moverseSegunVelocidadY()
		})})
	}

	method crearBolita() {
		var bolita = new Bolita(color = colores.anyOne(), velocidadEnX = velocidadesPosibles.anyOne() /*0.randomUpTo((game.width()/2)).roundUp()*/ , velocidadEnY = velocidadesPosibles.anyOne() /*0.randomUpTo((game.width()/2)).roundUp()*/ )
		bolita.aparecer()
		bolitas.add(bolita)
	}

	method crearBolitaNegra() {
		var bolitaNegra = new BolitaNegra(color = "negra", velocidadEnX = velocidadesPosibles.anyOne(), velocidadEnY = velocidadesPosibles.anyOne())
		bolitaNegra.aparecer()
		bolitas.add(bolitaNegra)
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}

	method crearParedes() {
		const ancho = game.width() - 1
		const alto = game.height() - 2
		(0 .. ancho).forEach{ n => posParedInferior.add(new Position(x = n, y = 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posParedSuperior.add(new Position(x = n, y = alto))} // bordeArriba 
		(0 .. alto).forEach{ n => posParedIzquierda.add(new Position(x = 0, y = n))} // bordeIzq 
		(0 .. alto).forEach{ n => posParedDerecha.add(new Position(x = ancho, y = n))} // bordeDer
		posParedInferior.forEach({ p => self.dibujar(new ParedInferior(position = p))})
		posParedSuperior.forEach({ p => self.dibujar(new ParedSuperior(position = p))})
		posParedIzquierda.forEach({ p => self.dibujar(new ParedIzquierda(position = p))})
		posParedDerecha.forEach({ p => self.dibujar(new ParedDerecha(position = p))})
	}

	method reglas(imagen) {
		self.quitarVisual()
		game.addVisual(imagen)
		self.estadoActual(opcionReglas)
	}

	method cuentaBolitasColorJugador() {
		var cantidad = 0
		 bolitas.forEach({ bolita => if(bolita.color() == jugador.colorJugador()) cantidad += 1 })
		 return cantidad
	}

	method eliminar(unaBolita) {
		bolitas.remove(unaBolita)
	}

}

object menuPrincipal {

	var property opcionAnterior = null
	var property opcionActual = self
	var property opcionDeArriba = opcionSalir
	var property opcionDeAbajo = opcionReglas

	method navegar() {
		game.addVisual(opcionActual)
	}

	method image() = "inicio.jpg"

	method position() = game.at(0, 0)

	method accion() {
		tablero.cargar()
	}

	method accionDel() {
		tablero.estadoActual(self)
		self.navegar()
		game.start()
	}

	method accionUp() {
		game.sound("entrarOpcion.ogg")
		opcionAnterior = opcionActual
		opcionActual = opcionActual.opcionDeArriba()
		game.addVisual(opcionActual)
		if (opcionActual != null) game.removeVisual(opcionAnterior)
	}

	method accionDown() {
		game.sound("entrarOpcion.ogg")
		opcionAnterior = opcionActual
		opcionActual = opcionActual.opcionDeAbajo()
		game.addVisual(opcionActual)
		if (opcionActual != null) game.removeVisual(opcionAnterior)
	}

	method accionEnter() {
		if (not opcionActual.equals(opcionSalir)) {
			game.sound("entrarOpcion.ogg")
		}
		opcionActual.accion()
	}

}

object opcionSalir {

	var property opcionDeArriba = opcionReglas
	var property opcionDeAbajo = menuPrincipal

	method image() = "Salir.jpg"

	method position() = game.at(0, 0)

	method accion() {
		game.stop()
	}

}

object reglas {

	method image() = "opcionreglas.jpg"

	method position() = game.at(0, 0)

}

object opcionReglas {

	var property opcionDeArriba = menuPrincipal
	var property opcionDeAbajo = opcionSalir

	method image() = "reglas.jpg"

	method position() = game.at(0, 0)

	method accion() {
		tablero.reglas(reglas)
	}

	method accionEnter() {
		tablero.estadoActual(menuPrincipal)
		game.addVisual(reglas)
	}

}

object cartelBolitas {

	var property position = game.at(game.width() - 1, game.height() - 1)

	method image() = tablero.cantBolitasColorJugador().toString() + ".png"

}

object cartelVidas {

	var property position = game.at(9, game.height() - 1)

	method image() = jugador.vidas().toString() + ".png"

}

object cartelJugador {

	var property position = game.at(7, game.height() - 1)

	method image() = jugador.image()

}

object bolitaColorJugador {

	var property position = game.at(game.width() - 3, game.height() - 1)

	method image() = "bolita" + jugador.colorJugador() + ".png"

}

