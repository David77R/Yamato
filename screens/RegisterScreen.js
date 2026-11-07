import { useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
} from 'react-native';
import { crearCuenta, mensajeDeError } from '../lib/auth';
import { colores } from '../theme/colores';

export default function RegisterScreen({ navigation }) {
  const [nombre, setNombre] = useState('');
  const [correo, setCorreo] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [confirmarContrasena, setConfirmarContrasena] = useState('');
  const [error, setError] = useState('');
  const [cargando, setCargando] = useState(false);

  const manejarRegistro = async () => {
    if (!nombre || !correo || !contrasena) {
      setError('Completa todos los campos');
      return;
    }
    if (contrasena !== confirmarContrasena) {
      setError('Las contraseñas no coinciden');
      return;
    }
    if (contrasena.length < 6) {
      setError('La contraseña necesita al menos 6 caracteres');
      return;
    }
    setError('');
    setCargando(true);
    const { error: fallo } = await crearCuenta({
      nombre: nombre.trim(),
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
      <ScrollView showsVerticalScrollIndicator={false}>

        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Text style={styles.volver}>← Volver</Text>
        </TouchableOpacity>

        <View style={styles.encabezado}>
          <Text style={styles.kanji}>結</Text>
          <Text style={styles.etiqueta}>NUEVO PACTO</Text>
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Nombre</Text>
          <TextInput
            style={styles.input}
            placeholder="Tu nombre"
            placeholderTextColor={colores.fantasma}
            value={nombre}
            onChangeText={setNombre}
          />
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

        <View style={styles.campo}>
          <Text style={styles.label}>Confirmar contraseña</Text>
          <TextInput
            style={styles.input}
            placeholder="••••••••"
            placeholderTextColor={colores.fantasma}
            value={confirmarContrasena}
            onChangeText={setConfirmarContrasena}
            secureTextEntry
          />
        </View>

        {error !== '' && (
          <Text style={styles.errorTexto}>{error}</Text>
        )}

        <TouchableOpacity
          style={[styles.boton, cargando && styles.botonInactivo]}
          onPress={manejarRegistro}
          disabled={cargando}
        >
          <Text style={styles.botonTexto}>
            {cargando ? 'SELLANDO' : 'SELLAR EL PACTO'}
          </Text>
        </TouchableOpacity>

        <View style={styles.loginFila}>
          <Text style={styles.loginTexto}>¿Ya tienes cuenta? </Text>
          <TouchableOpacity onPress={() => navigation.navigate('Login')}>
            <Text style={styles.loginLink}>Entrar</Text>
          </TouchableOpacity>
        </View>

      </ScrollView>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    backgroundColor: colores.fondo,
    paddingTop: 60,
    paddingHorizontal: 28,
  },
  volver: {
    color: colores.sutil,
    fontSize: 13,
    marginBottom: 24,
  },
  encabezado: {
    alignItems: 'center',
    marginBottom: 32,
  },
  kanji: {
    fontSize: 36,
    color: colores.acento,
    marginBottom: 8,
  },
  etiqueta: {
    fontSize: 11,
    color: colores.sutil,
    letterSpacing: 4,
  },
  campo: {
    marginBottom: 16,
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
  loginFila: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 40,
  },
  loginTexto: {
    fontSize: 12,
    color: colores.fantasma,
  },
  loginLink: {
    fontSize: 12,
    color: colores.acento,
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});