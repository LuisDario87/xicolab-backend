-- 1. Crear y seleccionar la base de datos
CREATE DATABASE IF NOT EXISTS xicolab_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE xicolab_db;

-- 2. Tabla de Categorías (Gastronomía, Cultura, Naturaleza, etc.)
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;

-- 3. Tabla Principal de Atractivos Turísticos
CREATE TABLE IF NOT EXISTS atractivos (
    id_atractivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    ubicacion_direccion VARCHAR(200),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    horarios VARCHAR(100),
    id_categoria INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 4. Tabla de Atributos de Accesibilidad (Inclusión Digital y Física)
CREATE TABLE IF NOT EXISTS accesibilidades (
    id_accesibilidad INT AUTO_INCREMENT PRIMARY KEY,
    id_atractivo INT NOT NULL,
    rampa_silla_ruedas BOOLEAN DEFAULT FALSE,
    audio_descripcion BOOLEAN DEFAULT FALSE,
    lengua_senas BOOLEAN DEFAULT FALSE,
    texto_alto_contraste BOOLEAN DEFAULT TRUE,
    subtitulos_disponibles BOOLEAN DEFAULT FALSE,
    audio_nahuatl BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_atractivo) REFERENCES atractivos(id_atractivo) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ======================================================
-- INSERCIÓN DE DATOS DE PRUEBA (DUMMY DATA PARA XICOTEPEC)
-- ======================================================

-- Inserción de Categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Cultural e Histórico', 'Sitios de interés histórico, monumentos y parroquias de Xicotepec'),
('Gastronomía', 'Restaurantes, cafeterías de café artesanal y platillos típicos'),
('Naturaleza y Aventura', 'Miradores, senderos y atractivos naturales');

-- Inserción de Atractivos de Xicotepec
INSERT INTO atractivos (nombre, descripcion, ubicacion_direccion, id_categoria) VALUES
('Parroquia de San Juan Bautista', 'Iglesia icónica ubicada en el centro de Xicotepec con arquitectura gótica.', 'Plaza Principal Centro, Xicotepec de Juárez, Pue.', 1),
('Monumento a la Virgen de Guadalupe', 'Escultura monumental ubicada en el cerro del Tabacal con vista panorámica.', 'Cerro del Tabacal, Xicotepec de Juárez, Pue.', 1),
('Café Gourmet Xicotepec', 'Establecimiento local tradicional con catación de café de altura.', 'Calle Zaragoza #102, Centro, Xicotepec de Juárez, Pue.', 2);

-- Inserción de Atributos Inclusivos
INSERT INTO accesibilidades (id_atractivo, rampa_silla_ruedas, audio_descripcion, lengua_senas, subtitulos_disponibles, audio_nahuatl) VALUES
(1, TRUE, TRUE, FALSE, TRUE, TRUE),   -- Parroquia
(2, FALSE, TRUE, TRUE, TRUE, FALSE),  -- Virgen del Tabacal
(3, TRUE, FALSE, FALSE, FALSE, FALSE); -- Cafetería