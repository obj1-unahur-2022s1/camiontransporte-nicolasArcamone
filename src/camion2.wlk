import cosas2.*

object camion {

	const cosasCargadas = []
    const tara = 1000
    const pesoMax = 2500

method cosasDentroDelCamion()=cosasCargadas
method cargar(cosa) {cosasCargadas.add(cosa); cosa.consecuenciaDeCarga()}
method descargar(cosa) {cosasCargadas.remove(cosa)}
method todoPesoPar() {return cosasCargadas.all{cosa=>cosa.peso().even()}}
method hayAlgunoQuePesa(peso){return cosasCargadas.any{c=>c.peso() == peso}}
method elDeNivel(nivel) {return cosasCargadas.find{c => c.nivelPeligrosidad() == nivel}}
method pesoTotal() {return cosasCargadas.sum{c=>c.peso()} + tara}
method excedidoDePeso(){return self.pesoTotal() > pesoMax}
method objetosQueSuperanPeligrosidad(nivel){return cosasCargadas.filter{c=>c.nivelPeligrosidad() > nivel}}
method objetosMasPeligrososQue(cosa) {return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())}
method puedeCircularEnRuta(nivelMaximoPeligrosidad){ return !self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()}
method tieneAlgoQuePesaEntre(min, max){return cosasCargadas.any{c=>c.peso().between(min,max)}}
method losQueTienenPesoEntre(min, max){return cosasCargadas.filter{c=>c.peso().between(min,max)}}
method cosaMasPesada(){return cosasCargadas.max{c=>c.peso()}}
method pesos(){return cosasCargadas.map{c=>c.peso()}}
method totalBultosCargados(){return cosasCargadas.sum{c=>c.totalBultos()}}

}
