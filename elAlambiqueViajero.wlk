// Luke
object luke {
    var vehiculo = alambiqueVeloz
    var lugaresVisitados = []
    var recuerdo = []
    method cambiarVehiculo(nuevoVehiculo) {vehiculo = nuevoVehiculo}
    method viajarA(unLugar) {
        if (unLugar.puedeSerVisitadoCon(vehiculo)){
            recuerdo = unLugar.recuerdo()
            lugaresVisitados.add(unLugar)
            vehiculo.viajarA(unLugar)
        } 
    }
    method cantidadDeLugaresVisitados(){return lugaresVisitados.size()}
    method ultimoRecuerdo(){return recuerdo}
}

// Vehiculos
object alambiqueVeloz {
    var combustible = 100
    method esRapido() {return true}
    method tieneCombustibleNecesario(necesario) {return combustible >= necesario}
    method viajarA(unLugar) {combustible = combustible - 20}
}
object superChatarraEspecial {
    var municiones = 5
    method esRapido() {return false}
    method tieneCombustibleNecesario(necesario){return municiones >= necesario / 20}
    method viajarA(unLugar){municiones = municiones - 1}
}
object antiguallaBlindada {
    var gangsters = 3
    method esRapido(){return gangsters > 2
    }
    method tieneCombustibleNecesario(necesario){return true}
    method viajarA(unLugar){gangsters = gangsters - 1}
}
object superConvertible {
    var forma = "auto"
    method formaActual() { return forma }
    method esRapido() {return forma == "auto"}
    method tieneCombustibleNecesario(necesario){return true}
    method viajarA(unLugar) {
        if (unLugar.esAcuatico()) {
            forma = "lancha"
        } else {
            forma = "auto"
        }
    }
}

// Lugares
object paris {
    method esAcuatico(){return false}
    method puedeSerVisitadoCon(unVehiculo) {
        return unVehiculo.tieneCombustibleNecesario(30)
    }
    method recuerdo() {return "Llavero de la Torre Eiffel"}
}
object buenosAires {
    var elPresidenteAmaElMate = true
    var recuerdo = ""
    method esAcuatico(){return false}
    method puedeSerVisitadoCon(unVehiculo) {
        return unVehiculo.esRapido()
    }
    method elPresidenteAmaElMate(){return elPresidenteAmaElMate}
    method cambiarOpinion(){elPresidenteAmaElMate = not elPresidenteAmaElMate}
    method recuerdo(){
        if(self.elPresidenteAmaElMate()){
            recuerdo = "Mate con yerba"
        } else {
            recuerdo = "Mate sin yerba"
        }
        return recuerdo 
    }
}
object bagdad {
    var posiblesRecuerdos = ["Bidón de petróleo", "Arma misteriosa", "Réplica de jardines colgantes"]
    method esAcuatico(){return false}
    method puedeSerVisitadoCon(unVehiculo){return true}
    method recuerdo(){
        return posiblesRecuerdos.any()   
    }
}
object lasVegas {
    var homenaje = paris
    method esAcuatico(){return false}
    method puedeSerVisitadoCon(unVehiculo) {
        return homenaje.puedeSerVisitadoCon(unVehiculo)
    }
    method recuerdo() {return homenaje.recuerdo()}
    method cambiarHomenaje(otroHomenaje){homenaje = otroHomenaje}
}

// Nuevos destinos
object tokio {
    method esAcuatico(){return false}
    method puedeSerVisitadoCon(unVehiculo){return true}
    method recuerdo(){return "Figura de Anime"}
}
object venecia {
    method esAcuatico() { return true }
    method puedeSerVisitadoCon(unVehiculo) {return true}
    method recuerdo() {return "Máscara del Carnaval"}
}