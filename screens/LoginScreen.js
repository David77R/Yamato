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

export default function LoginScreen({ navigation }) {
  const [correo, setCorreo] = useState('');
  const [contrasena, setContrasena] = useState('');

  const manejarLogin = () => {
    console.log('Login con:', correo, contrasena);
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

      <TouchableOpacity style={styles.boton} onPress={manejarLogin}>
        <Text style={styles.botonTexto}>ROMPER EL SELLO</Text>
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
    backgroundColor: '#080808',
    paddingTop: 80,
    paddingHorizontal: 28,
  },
  encabezado: {
    alignItems: 'center',
    marginBottom: 40,
  },
  kanji: {
    fontSize: 40,
    color: '#cc1111',
    marginBottom: 8,
  },
  etiqueta: {
    fontSize: 11,
    color: '#555555',
    letterSpacing: 4,
  },
  campo: {
    marginBottom: 20,
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
  registroFila: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    flexWrap: 'wrap',
  },
  registroTexto: {
    fontSize: 12,
    color: '#444444',
  },
  registroLink: {
    fontSize: 12,
    color: '#cc1111',
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});