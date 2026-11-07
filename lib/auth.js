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

export function mensajeDeError(error) {
  if (!error) return '';
  const m = (error.message || '').toLowerCase();
  if (m.includes('invalid login credentials')) return 'Correo o contraseña incorrectos.';
  if (m.includes('already registered') || m.includes('already been registered')) return 'Ese correo ya tiene una cuenta.';
  if (m.includes('password should be at least')) return 'La contraseña necesita al menos 6 caracteres.';
  if (m.includes('unable to validate email') || m.includes('invalid format')) return 'Ese correo no parece válido.';
  if (m.includes('anonymous sign-ins are disabled')) return 'Faltan habilitar las sesiones anónimas en Supabase.';
  if (m.includes('email rate limit') || m.includes('too many')) return 'Demasiados intentos. Espera un momento.';
  if (m.includes('network') || m.includes('failed to fetch')) return 'Sin conexión. Revisa tu internet e intenta de nuevo.';
  return 'Algo salió mal. Intenta de nuevo.';
}
