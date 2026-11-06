import { supabase } from './supabase';

export function esTurista(sesion) {
  return Boolean(sesion?.user?.is_anonymous);
}

export async function sesionActual() {
  const { data } = await supabase.auth.getSession();
  return data.session ?? null;
}

export async function asegurarSesion() {
  const { data } = await supabase.auth.getSession();
  if (data.session) return { sesion: data.session, error: null };

  const { data: creada, error } = await supabase.auth.signInAnonymously();
  return { sesion: creada?.session ?? null, error: error ?? null };
}

export async function crearCuenta({ nombre, correo, contrasena }) {
  const { data } = await supabase.auth.getSession();
  const actual = data.session?.user ?? null;

  if (actual?.is_anonymous) {
    const { error } = await supabase.auth.updateUser({
      email: correo,
      password: contrasena,
      data: { nombre },
    });
    if (error) return { error };

    await supabase
      .from('usuarios')
      .update({ nombre, correo })
      .eq('id', actual.id);

    return { error: null };
  }

  const { error } = await supabase.auth.signUp({
    email: correo,
    password: contrasena,
    options: { data: { nombre } },
  });
  return { error: error ?? null };
}

export async function entrar({ correo, contrasena }) {
  const { error } = await supabase.auth.signInWithPassword({
    email: correo,
    password: contrasena,
  });
  return { error: error ?? null };
}

export async function salir() {
  await supabase.auth.signOut();
  return asegurarSesion();
}

export function alCambiarSesion(callback) {
  const { data } = supabase.auth.onAuthStateChange((_evento, sesion) => {
    callback(sesion ?? null);
  });
  return () => data.subscription.unsubscribe();
}
