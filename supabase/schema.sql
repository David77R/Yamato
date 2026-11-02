create extension if not exists "uuid-ossp";

create table categorias (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  nombre text not null,
  descripcion text,
  emoji text,
  orden int not null default 0,
  created_at timestamptz default now()
);

create table historias (
  id uuid primary key default uuid_generate_v4(),
  categoria_id uuid not null references categorias(id) on delete cascade,
  titulo text not null,
  subtitulo text,
  resumen text,
  nota_cultural text,
  cuerpo text not null,
  imagen_url text,
  es_premium boolean not null default false,
  orden int not null default 0,
  created_at timestamptz default now()
);

create table usuarios (
  id uuid primary key references auth.users(id) on delete cascade,
  nombre text,
  correo text,
  created_at timestamptz default now()
);

create table suscripciones (
  id uuid primary key default uuid_generate_v4(),
  usuario_id uuid not null references usuarios(id) on delete cascade,
  estado text not null default 'inactiva',
  plan text,
  expira_en timestamptz,
  created_at timestamptz default now(),
  unique (usuario_id)
);

create table favoritos (
  id uuid primary key default uuid_generate_v4(),
  usuario_id uuid not null references usuarios(id) on delete cascade,
  historia_id uuid not null references historias(id) on delete cascade,
  created_at timestamptz default now(),
  unique (usuario_id, historia_id)
);

create table lecturas (
  id uuid primary key default uuid_generate_v4(),
  usuario_id uuid not null references usuarios(id) on delete cascade,
  historia_id uuid not null references historias(id) on delete cascade,
  leida_en timestamptz default now(),
  unique (usuario_id, historia_id)
);

create index idx_historias_categoria on historias(categoria_id);
create index idx_favoritos_usuario on favoritos(usuario_id);
create index idx_lecturas_usuario on lecturas(usuario_id);

alter table categorias enable row level security;
alter table historias enable row level security;
alter table usuarios enable row level security;
alter table suscripciones enable row level security;
alter table favoritos enable row level security;
alter table lecturas enable row level security;

create policy "categorias visibles para todos"
  on categorias for select
  using (true);

create policy "historias visibles para todos"
  on historias for select
  using (true);

create policy "usuario lee su propio perfil"
  on usuarios for select
  using (auth.uid() = id);

create policy "usuario actualiza su propio perfil"
  on usuarios for update
  using (auth.uid() = id);

create policy "usuario lee su suscripcion"
  on suscripciones for select
  using (auth.uid() = usuario_id);

create policy "usuario gestiona sus favoritos"
  on favoritos for all
  using (auth.uid() = usuario_id)
  with check (auth.uid() = usuario_id);

create policy "usuario gestiona sus lecturas"
  on lecturas for all
  using (auth.uid() = usuario_id)
  with check (auth.uid() = usuario_id);

create function public.manejar_nuevo_usuario()
returns trigger
language plpgsql
security definer set search_path = public
as $func$
begin
  insert into public.usuarios (id, nombre, correo)
  values (new.id, new.raw_user_meta_data->>'nombre', new.email);
  insert into public.suscripciones (usuario_id, estado)
  values (new.id, 'inactiva');
  return new;
end;
$func$;

create trigger al_crear_usuario
  after insert on auth.users
  for each row execute function public.manejar_nuevo_usuario();
