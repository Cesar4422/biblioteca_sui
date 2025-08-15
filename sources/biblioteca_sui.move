// sources/biblioteca_sui.move

// Módulo con la sintaxis más robusta y compatible
module biblioteca_sui::prestamos_libros {
    // --- Imports limpios ---
    use sui::object;
    use sui::transfer;
    use sui::tx_context;
    use sui::clock;
    use sui::coin;
    use sui::balance;

    // --- Definimos tipos que usaremos a menudo ---
    use sui::object::{ID, UID};
    use sui::tx_context::TxContext;
    use sui::clock::Clock;
    use sui::coin::Coin;
    use sui::balance::Balance;

    // --- Objetos (Structs) ---
    public struct AdminCap has key, store {
        id: UID
    }

    public struct LibroNFT has key, store {
        id: UID,
        titulo: vector<u8>,
        autor: vector<u8>
    }

    public struct Garantia has store {
        fondos: Balance<sui::sui::SUI>
    }

    public struct Prestamo has key, store {
        id: UID,
        libro_id: ID,
        garantia: Garantia,
        prestatario: address,
        fecha_vencimiento: u64,
    }

    // --- Funciones ---

    fun init(ctx: &mut TxContext) {
        transfer::public_transfer(AdminCap {
            id: object::new(ctx)
        }, tx_context::sender(ctx))
    }

    public entry fun acunar_libro(
        _admin_cap: &AdminCap,
        titulo: vector<u8>,
        autor: vector<u8>,
        ctx: &mut TxContext
    ) {
        let libro = LibroNFT {
            id: object::new(ctx),
            titulo,
            autor
        };
        transfer::public_transfer(libro, tx_context::sender(ctx));
    }

    public entry fun prestar_libro(
        libro: LibroNFT,
        monedas_garantia: Coin<sui::sui::SUI>,
        clock: &Clock,
        ctx: &mut TxContext
    ) {
        let duracion_prestamo_ms = 2 * 60 * 1000; // 2 minutos para pruebas
        let prestatario = tx_context::sender(ctx);

        let garantia = Garantia {
            fondos: coin::into_balance(monedas_garantia)
        };

        let prestamo = Prestamo {
            id: object::new(ctx),
            libro_id: object::id(&libro),
            garantia,
            prestatario,
            fecha_vencimiento: clock::timestamp_ms(clock) + duracion_prestamo_ms,
        };

        transfer::public_transfer(libro, prestatario);
        transfer::public_transfer(prestamo, prestatario);
    }
}