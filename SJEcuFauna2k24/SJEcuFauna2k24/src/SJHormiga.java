abstract class SJHormiga {
    String tipo;
    boolean comer(String alimento) {
        // Implementación genérica de comer
        return false;
    }

    @Override
    public String toString() {
        return tipo;
    }
}

// Clase para la Larva
class Larva extends SJHormiga {
    public Larva() {
        this.tipo = "Larva";
    }
}

// Clase para Soldado
class Soldado extends SJHormiga {
    public Soldado() {
        this.tipo = "Soldado";
    }
}

// Clase para Rastreadora
class Rastreadora extends SJHormiga {
    public Rastreadora() {
        this.tipo = "Rastreadora";
    }
}

// Clase abstracta para IngestaNativa
abstract class IngestaNativa {
    String tipo;
}

// Clase abstracta para GenoAlimento
abstract class GenoAlimento {
    String tipo;
}