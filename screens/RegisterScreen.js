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

export default function RegisterScreen({ navigation }) {
  const [nombre, setNombre] = useState('');
  const [correo, setCorreo] = useState('');
  const [contrasena, setContrasena] = useState('');
  const [confirmarContrasena, setConfirmarContrasena] = useState('');
  const [error, setError] = useState('');

  const manejarRegistro = () => {
    if (!nombre || !correo || !contrasena) {
      setError('Completa todos los campos');
      return;
    }
    if (contrasena !== confirmarContrasena) {
      setError('Las contraseñas no coinciden');
      return;
    }
    setError('');
    console.log('Registrar:', nombre, correo, contrasena);
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
            placeholderTextColor="#444444"
            value={nombre}
            onChangeText={setNombre}
          />
        </View>

        <View style={styles.campo}>
          <Text style={styles.label}>Correo</Text>
          <TextInput
            style={styles.input}
            placeholder="tu@correo.com"
            placeholderTextColor="#444444"
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
            placeholderTextColor="#444444"
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
            placeholderTextColor="#444444"
            value={confirmarContrasena}
            onChangeText={setConfirmarContrasena}
            secureTextEntry
          />
        </View>

        {error !== '' && (
          <Text style={styles.errorTexto}>{error}</Text>
        )}

        <TouchableOpacity style={styles.boton} onPress={manejarRegistro}>
          <Text style={styles.botonTexto}>SELLAR EL PACTO</Text>
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
    backgroundColor: '#080808',
    paddingTop: 60,
    paddingHorizontal: 28,
  },
  volver: {
    color: '#555555',
    fontSize: 13,
    marginBottom: 24,
  },
  encabezado: {
    alignItems: 'center',
    marginBottom: 32,
  },
  kanji: {
    fontSize: 36,
    color: '#cc1111',
    marginBottom: 8,
  },
  etiqueta: {
    fontSize: 11,
    color: '#555555',
    letterSpacing: 4,
  },
  campo: {
    marginBottom: 16,
  },
  label: {
    fontSize: 11,
    color: '#666666',
    letterSpacing: 1,
    marginBottom: 6,
  },
  input: {
    backgroundColor: '#0f0f0f',
    borderWidth: 0.5,
    borderColor: '#2a2a2a',
    borderLeftWidth: 2,
    borderLeftColor: '#cc1111',
    borderRadius: 2,
    padding: 14,
    color: '#ffffff',
    fontSize: 14,
  },
  errorTexto: {
    color: '#ff5555',
    fontSize: 12,
    marginBottom: 12,
    textAlign: 'center',
  },
  boton: {
    backgroundColor: '#cc1111',
    padding: 14,
    alignItems: 'center',
    marginTop: 8,
    marginBottom: 24,
  },
  botonTexto: {
    color: '#ffffff',
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
    color: '#444444',
  },
  loginLink: {
    fontSize: 12,
    color: '#cc1111',
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});