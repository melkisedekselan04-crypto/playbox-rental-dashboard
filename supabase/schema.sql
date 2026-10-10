CREATE TABLE IF NOT EXISTS public.rentals (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  unit TEXT NOT NULL,
  package TEXT NOT NULL,
  collateral TEXT NOT NULL DEFAULT 'KTP Asli',
  collateral_image TEXT,
  price NUMERIC NOT NULL DEFAULT 0,
  start_time TIMESTAMPTZ NOT NULL,
  return_time TIMESTAMPTZ NOT NULL,
  status TEXT NOT NULL DEFAULT 'Aktif',
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.rentals ENABLE ROW LEVEL SECURITY;

CREATE POLICY IF NOT EXISTS "Allow read access to rentals"
ON public.rentals
FOR SELECT
USING (true);

CREATE POLICY IF NOT EXISTS "Allow insert access to rentals"
ON public.rentals
FOR INSERT
WITH CHECK (true);

CREATE POLICY IF NOT EXISTS "Allow update access to rentals"
ON public.rentals
FOR UPDATE
USING (true)
WITH CHECK (true);

CREATE POLICY IF NOT EXISTS "Allow delete access to rentals"
ON public.rentals
FOR DELETE
USING (true);

CREATE INDEX IF NOT EXISTS rentals_created_at_idx
ON public.rentals (created_at DESC);
