import { useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { entrar, mensajeDeError } from '../lib/auth';
import { colores } from '../theme/colores';

export default function LoginScreen({ navigation }) {
  const [correo, setCorreo] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [cargando, setCargando] = useState(false);
  const [error, setError] = useState('');

  const manejarLogin = async () => {
    if (!correo || !contrasena) {
      setError('Escribe tu correo y tu contraseña');
      return;
    }
    setError('');
    setCargando(true);
    const { error: fallo } = await entrar({
      correo: correo.trim(),
      contrasena,
    });
    setCargando(false);
    if (fallo) {
      setError(mensajeDeError(fallo));
      return;
    }
    navigation.navigate('Home');
  };

  return (
    <KeyboardAvoidingView
      style={styles.contenedor}
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    >
      <View style={styles.encabezado}>
        <Text style={styles.kanji}>封</Text>
        <Text style={styles.etiqueta}>SELLO DE ENTRADA</Text>
      </View>

      <View style={styles.campo}>
        <Text style={styles.label}>Correo</Text>
        <TextInput
          style={styles.input}
          placeholder="tu@correo.com"
          placeholderTextColor={colores.fantasma}
          value={correo}
          onChangeText={setCorreo}
          autoCapitalize="none"
          keyboardType="email-address"
        />
      </View>

      <View style={styles.campo}>
        <Text style={styles.label}>Contraseña</Text>
        <TextInput
          style={styles.input}
          placeholder="••••••••"
          placeholderTextColor={colores.fantasma}
          value={contrasena}
          onChangeText={setContrasena}
          secureTextEntry
        />
      </View>

      {error !== '' && <Text style={styles.errorTexto}>{error}</Text>}

      <TouchableOpacity
        style={[styles.boton, cargando && styles.botonInactivo]}
        onPress={manejarLogin}
        disabled={cargando}
      >
        <Text style={styles.botonTexto}>
          {cargando ? 'ABRIENDO' : 'ROMPER EL SELLO'}
        </Text>
      </TouchableOpacity>

      <View style={styles.registroFila}>
        <Text style={styles.registroTexto}>¿Primera vez en el archipiélago? </Text>
        <TouchableOpacity onPress={() => navigation.navigate('Register')}>
          <Text style={styles.registroLink}>Crear cuenta</Text>
        </TouchableOpacity>
      </View>

    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    backgroundColor: colores.fondo,
    paddingTop: 80,
    paddingHorizontal: 28,
  },
  encabezado: {
    alignItems: 'center',
    marginBottom: 40,
  },
  kanji: {
    fontSize: 40,
    color: colores.acento,
    marginBottom: 8,
  },
  etiqueta: {
    fontSize: 11,
    color: colores.sutil,
    letterSpacing: 4,
  },
  campo: {
    marginBottom: 20,
  },
  label: {
    fontSize: 11,
    color: colores.tenue,
    letterSpacing: 1,
    marginBottom: 6,
  },
  input: {
    backgroundColor: colores.campo,
    borderWidth: 0.5,
    borderColor: colores.bordeCampo,
    borderLeftWidth: 2,
    borderLeftColor: colores.acento,
    borderRadius: 2,
    padding: 14,
    color: colores.tinta,
    fontSize: 14,
  },
  errorTexto: {
    color: colores.error,
    fontSize: 12,
    marginBottom: 12,
    textAlign: 'center',
  },
  botonInactivo: {
    opacity: 0.55,
  },
  boton: {
    backgroundColor: colores.acento,
    padding: 14,
    alignItems: 'center',
    marginTop: 8,
    marginBottom: 24,
  },
  botonTexto: {
    color: colores.tinta,
    fontSize: 13,
    letterSpacing: 3,
    fontWeight: 'bold',
  },
  registroFila: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    flexWrap: 'wrap',
  },
  registroTexto: {
    fontSize: 12,
    color: colores.fantasma,
  },
  registroLink: {
    fontSize: 12,
    color: colores.acento,
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});