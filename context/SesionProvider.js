import { createContext, useContext, useEffect, useMemo, useState } from 'react';
import { alCambiarSesion, asegurarSesion, esTurista } from '../lib/auth';

const ContextoSesion = createContext(null);

export function SesionProvider({ children }) {
  const [sesion, setSesion] = useState(null);
  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    let vivo = true;

    asegurarSesion().then(({ sesion, error }) => {
      if (!vivo) return;
      setSesion(sesion);
      setError(error ? error.message : null);
      setCargando(false);
    });

    const cancelar = alCambiarSesion((nueva) => {
      if (vivo) setSesion(nueva);
    });

    return () => {
      vivo = false;
      cancelar();
    };
  }, []);

  const valor = useMemo(
    () => ({
      sesion,
      usuario: sesion?.user ?? null,
      turista: esTurista(sesion),
      registrado: Boolean(sesion) && !esTurista(sesion),
      cargando,
      error,
    }),
    [sesion, cargando, error]
  );

  return (
    <ContextoSesion.Provider value={valor}>{children}</ContextoSesion.Provider>
  );
}

export function useSesion() {
  const valor = useContext(ContextoSesion);
  if (!valor) {
    throw new Error('useSesion debe usarse dentro de SesionProvider');
  }
  return valor;
}
