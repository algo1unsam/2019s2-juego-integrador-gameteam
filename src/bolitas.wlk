import wollok.game.*

class Bolita {
	var property color
	var property position = game.center()
	var property velocidadEnX 
	var property velocidadEnY
	
	method image() = "bolita" + color.toString() + ".png"
	
	method moverseHacia(unaPosicion){
		position = unaPosicion
	}
	
	method velocidadX(velX) {
		self.moverseHacia(self.position().right(velX))
	}
	
	method velocidadY(velY) {
		self.moverseHacia(self.position().up(velY))
	}
	
	method desaparecer() {
		game.removeVisual(self)
	}
	
	
	
}

