 object knightRider {
	
method peso()=500
method nivelPeligrosidad()=10
method totalBultos() = 1
method consecuenciaDeCarga(){}
}

object bumblebee {
  var transformado = true

method transformadoEnAuto(){transformado = true}
method transformadoEnRobot(){transformado = false}
method peso()=800
method nivelPeligrosidad(){return if(not transformado) 30 else 15}
method totalBultos()=2
method consecuenciaDeCarga(){ self.transformadoEnRobot()}
}

object paqueteLadrillos{
	var cantLadrillos = 0

method agregarLadrillos(cantidad){cantLadrillos = cantidad}
method peso(){return cantLadrillos * 2}
method nivelPeligrosidad()=2
method cantidadLadrillos()=cantLadrillos
method totalBultos(){ 
	if(self.cantidadLadrillos() <= 100){
		return 1
	} 
 	else if(self.cantidadLadrillos().between(101,300)){
 		return 2
 	}
 	else{
 		return 3
 	}
}
method consecuenciaDeCarga(){cantLadrillos += 12}
}

object arenaGranel {
	var pesoActual = 0

method aniadirPeso(kgs){pesoActual = kgs}
method peso()= pesoActual
method nivelPeligrosidad()=1
method totalBultos()=1
method consecuenciaDeCarga(){ pesoActual += 20}
}

object bateriaAntiaerea {
	var tieneMisiles = false

method cargarMisiles(){ tieneMisiles = true}
method noEstaCargada() {tieneMisiles = false}
method peso(){return if( tieneMisiles)  300 else 200}
method nivelPeligrosidad(){return if( tieneMisiles)  100 else 0}
method consecuenciaDeCarga(){self.cargarMisiles()}
method totalBultos(){return if(tieneMisiles) 1 else 2}

}

object contenedor {
	const cosasDentro = []
	const pesoBase = 100
    const bultoBase = 1
    
method cosasDentroContenedor()= cosasDentro
method cargar(objeto){cosasDentro.add(objeto)}	
method peso(){return pesoBase + cosasDentro.sum{c=>c.peso()} }
method nivelPeligrosidad(){return if(self.estaVacio()) 0 else cosasDentro.max{c=>c.nivelPeligrosidad()}.nivelPeligrosidad()}
method estaVacio(){return cosasDentro.isEmpty()}
method consecuenciaDeCarga(){cosasDentro.forEach{c=>c.consecuenciaDeCarga()}}
method totalBultos(){return bultoBase + cosasDentro.sum{c=>c.totalBultos()} }

}

object residuosRadioactivos {
	var pesoActual 

method pesoAniadido(kgs){pesoActual = kgs}
method peso()= pesoActual
method nivelPeligrosidad() = 200
method totalBultos()=1
method consecuenciaDeCarga(){pesoActual += 15}
}

object embalajeSeguridad {
	var cosaDentro 

method cosaAEmbalar(cosa) { cosaDentro = cosa}	
method peso(){return cosaDentro.peso()}
method nivelPeligrosidad(){ return cosaDentro.nivelPeligrosidad() / 2}
method totalBultos()=2
method consecuenciaDeCarga(){}
}


 