-- ==============================================================================
-- Proyecto: Museo Arocena — Entre Obras Digital Experience
-- Base de Datos: Supabase (PostgreSQL)
-- Archivo: schema.sql (Tabla y Políticas de Seguridad RLS para Reservaciones)
-- ==============================================================================

-- 1. Crear tabla de reservaciones
CREATE TABLE IF NOT EXISTS public.reservaciones (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    nombre TEXT NOT NULL,
    email TEXT NOT NULL,
    telefono TEXT,
    experiencia TEXT NOT NULL DEFAULT 'Mesa a la Carta',
    numero_personas TEXT NOT NULL DEFAULT '2',
    fecha TEXT NOT NULL,
    hora TEXT NOT NULL,
    espacio TEXT DEFAULT 'Salón Arcadas 1910',
    notas TEXT,
    estado TEXT DEFAULT 'pendiente'
);

-- 2. Activar Row Level Security (RLS)
ALTER TABLE public.reservaciones ENABLE ROW LEVEL SECURITY;

-- 3. Política de inserción pública:
-- Permite que los visitantes de la landing page envíen su reservación usando la clave pública 'anon'
CREATE POLICY "Permitir crear reservaciones desde la web"
ON public.reservaciones
FOR INSERT
TO anon, authenticated
WITH CHECK (true);

-- 4. Política de lectura restringida:
-- Los visitantes públicos NO pueden ver los datos personales ni reservas de otros comensales.
-- Solo personal autenticado del Museo Arocena puede ver la lista de reservaciones.
CREATE POLICY "Solo administradores pueden consultar reservaciones"
ON public.reservaciones
FOR SELECT
TO authenticated
USING (true);

-- 5. Índices de rendimiento
CREATE INDEX IF NOT EXISTS idx_reservaciones_fecha ON public.reservaciones(fecha);
CREATE INDEX IF NOT EXISTS idx_reservaciones_email ON public.reservaciones(email);
