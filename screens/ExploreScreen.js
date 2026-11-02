import { useEffect, useState } from 'react';
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  FlatList,
  ActivityIndicator,
} from 'react-native';
import { supabase } from '../lib/supabase';
import { colores } from '../theme/colores';


export default function ExploreScreen({ navigation }) {
  const [categorias, setCategorias] = useState([]);
  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const cargarCategorias = async () => {
      const { data, error } = await supabase
        .from('categorias')
        .select('id, slug, nombre, descripcion, emoji')
        .order('orden');

      if (error) {
        setError(error.message);
      } else {
        setCategorias(data);
      }
      setCargando(false);
    };

    cargarCategorias();
  }, []);

  return (
    <View style={styles.contenedor}>

      <TouchableOpacity onPress={() => navigation.goBack()}>
        <Text style={styles.volver}>← Volver</Text>
      </TouchableOpacity>

      <Text style={styles.titulo}>Explorar</Text>
      <Text style={styles.subtitulo}>Elige tu camino al misterio</Text>

      {cargando && (
        <ActivityIndicator color={colores.acento} style={styles.cargando} />
      )}

      {error && (
        <Text style={styles.error}>No se pudo cargar: {error}</Text>
      )}

      <FlatList
        data={categorias}
        keyExtractor={(item) => item.id}
        showsVerticalScrollIndicator={false}
        renderItem={({ item }) => (
          <TouchableOpacity
            style={styles.tarjeta}
            onPress={() =>
              navigation.navigate('CategoryList', {
                categoria: item.slug,
                nombreCategoria: item.nombre,
              })
            }
          >
            <Text style={styles.emoji}>{item.emoji}</Text>
            <View style={styles.textos}>
              <Text style={styles.nombre}>{item.nombre}</Text>
              <Text style={styles.descripcion}>{item.descripcion}</Text>
            </View>
          </TouchableOpacity>
        )}
      />

    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    backgroundColor: colores.fondo,
    paddingTop: 60,
    paddingHorizontal: 24,
  },
  volver: {
    color: colores.sutil,
    fontSize: 13,
    marginBottom: 16,
  },
  titulo: {
    color: colores.tinta,
    fontSize: 28,
    fontWeight: 'bold',
    letterSpacing: 1,
  },
  subtitulo: {
    color: colores.tenue,
    fontSize: 13,
    marginTop: 4,
    marginBottom: 24,
  },
  tarjeta: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colores.superficie,
    borderWidth: 0.5,
    borderColor: colores.borde,
    borderRadius: 14,
    padding: 16,
    marginBottom: 10,
  },
  emoji: {
    fontSize: 28,
    marginRight: 14,
  },
  textos: {
    flex: 1,
  },
  nombre: {
    color: colores.tinta,
    fontSize: 15,
    fontWeight: 'bold',
  },
  descripcion: {
    color: colores.neblina,
    fontSize: 11,
    marginTop: 2,
  },
  cargando: {
    marginTop: 40,
  },
  error: {
    color: colores.error,
    fontSize: 12,
    textAlign: 'center',
    marginTop: 20,
  },
});