import { useRef } from 'react';
import {
  Animated,
  Image,
  PanResponder,
  StyleSheet,
  View,
} from 'react-native';
import MaskedView from '@react-native-masked-view/masked-view';

const LUZ = require('../assets/arte/luz.png');

export default function LienzoRevelado({
  fuente,
  tamanoLuz = 320,
  brilloBase = 0.07,
  onPrimerToque,
  children,
}) {
  const pos = useRef(new Animated.ValueXY({ x: -9999, y: -9999 })).current;
  const opacidad = useRef(new Animated.Value(0)).current;
  const yaTocado = useRef(false);
  const avisar = useRef(onPrimerToque);
  avisar.current = onPrimerToque;

  const pan = useRef(
    PanResponder.create({
      onStartShouldSetPanResponder: () => true,
      onMoveShouldSetPanResponder: () => true,
      onPanResponderGrant: (e) => {
        const { locationX, locationY } = e.nativeEvent;
        pos.setValue({
          x: locationX - tamanoLuz / 2,
          y: locationY - tamanoLuz / 2,
        });
        Animated.timing(opacidad, {
          toValue: 1,
          duration: 200,
          useNativeDriver: true,
        }).start();
        if (!yaTocado.current) {
          yaTocado.current = true;
          avisar.current?.();
        }
      },
      onPanResponderMove: (e) => {
        const { locationX, locationY } = e.nativeEvent;
        pos.setValue({
          x: locationX - tamanoLuz / 2,
          y: locationY - tamanoLuz / 2,
        });
      },
      onPanResponderRelease: () => {
        Animated.timing(opacidad, {
          toValue: 0,
          duration: 700,
          useNativeDriver: true,
        }).start();
      },
      onPanResponderTerminate: () => {
        Animated.timing(opacidad, {
          toValue: 0,
          duration: 700,
          useNativeDriver: true,
        }).start();
      },
    })
  ).current;

  return (
    <View style={StyleSheet.absoluteFill}>
      <View style={StyleSheet.absoluteFill} {...pan.panHandlers}>
        <Image
          source={fuente}
          style={[StyleSheet.absoluteFill, { opacity: brilloBase }]}
          resizeMode="cover"
        />

        <Animated.View
          style={[StyleSheet.absoluteFill, { opacity: opacidad }]}
          pointerEvents="none"
        >
          <MaskedView
            style={StyleSheet.absoluteFill}
            maskElement={
              <View style={styles.mascara}>
                <Animated.Image
                  source={LUZ}
                  style={{
                    position: 'absolute',
                    width: tamanoLuz,
                    height: tamanoLuz,
                    transform: pos.getTranslateTransform(),
                  }}
                />
              </View>
            }
          >
            <Image
              source={fuente}
              style={StyleSheet.absoluteFill}
              resizeMode="cover"
            />
          </MaskedView>
        </Animated.View>
      </View>

      <View style={StyleSheet.absoluteFill} pointerEvents="box-none">
        {children}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  mascara: {
    flex: 1,
    backgroundColor: 'transparent',
  },
});
