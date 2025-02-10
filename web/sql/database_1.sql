use DATA_BASE_WEB_PORTAL_INSCRPTION

-- Crear la base de datos 
CREATE DATABASE DATA_BASE_WEB_PORTAL_INSCRPTION;
GO

-- Tabla de estudiantes
CREATE TABLE Estudiantes(
    IDEstudiante INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    IDProgramaAcademico INT NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Contrasena VARCHAR(255) NOT NULL
);
GO
select * from Estudiantes


INSERT INTO Estudiantes (Nombre, Apellido, IDProgramaAcademico, CorreoElectronico, Contrasena) 
VALUES 
('Luis', 'Ramírez', 1, 'luis.ramirez@example.com', 'luis123'),
('Sofía', 'Hernández', 2, 'sofia.hernandez@example.com', 'sofia456'),
('Diego', 'Torres', 3, 'diego.torres@example.com', 'diego789');
UPDATE Estudiantes

SELECT * FROM Estudiantes;

SELECT * FROM ProgramasAcademicos;
INSERT INTO ProgramasAcademicos (NombrePrograma)
VALUES 
('Programa 1'), 
('Programa 2'), 
('Programa 3'), 
('Programa 4');

INSERT INTO ProgramasAcademicos (NombrePrograma) 
VALUES 
('Ingeniería en Sistemas'), 
('Administración de Empresas'), 
('Psicología');


INSERT INTO Estudiantes (Nombre, Apellido, IDProgramaAcademico, CorreoElectronico, Contrasena) 
VALUES 
('Juan', 'Pérez', 1, 'juan.perez@example.com', 'contraseña123'),
('María', 'Gómez', 2, 'maria.gomez@example.com', 'contraseña456'),
('Carlos', 'López', 3, 'carlos.lopez@example.com', 'contraseña789'),
('Ana', 'Martínez', 4, 'ana.martinez@example.com', 'contraseña321');

UPDATE Estudiantes
SET CorreoElectronico = 'nuevo.correo@example.com'
WHERE IDEstudiante = 1;

-- Tabla de programas académicos
CREATE TABLE ProgramasAcademicos (
    IDProgramaAcademico INT PRIMARY KEY IDENTITY(1,1),
    NombrePrograma VARCHAR(100) NOT NULL
);
GO

-- Tabla de clases
CREATE TABLE Clases (
    IDClase INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Horario VARCHAR(50),
    Ubicacion VARCHAR(100),
    CupoMaximoEstudiantes INT
);
GO

INSERT INTO Clases (Nombre, Descripcion, Horario, Ubicacion, CupoMaximoEstudiantes) 
VALUES 
('1,Matemáticas Avanzadas', 'Curso de cálculo integral y diferencial', 'Lunes 08:00-10:00', 'Aula 101', 30),
('2,Introducción a la Psicología', 'Conceptos básicos de la psicología', 'Martes 10:00-12:00', 'Aula 202', 25),
('3,Gestión Financiera', 'Principios de finanzas para empresas', 'Miércoles 14:00-16:00', 'Aula 303', 35);

-- Tabla de profesores
CREATE TABLE Profesores (
    IDProfesor INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    TituloAcademico VARCHAR(100),
    IDDepartamentoAcademico INT,
    CorreoElectronico VARCHAR(100) UNIQUE
);
GO


INSERT INTO Profesores (Nombre, Apellido, TituloAcademico, IDDepartamentoAcademico, CorreoElectronico) 
VALUES 
('Andrés', 'González', 'Doctor en Matemáticas', 1, 'andres.gonzalez@univ.edu'),
('Marta', 'Salinas', 'Doctora en Psicología', 2, 'marta.salinas@univ.edu'),
('Pedro', 'Vargas', 'MBA en Finanzas', 3, 'pedro.vargas@univ.edu');


-- Tabla de departamentos académicos
CREATE TABLE DepartamentosAcademicos (
    IDDepartamentoAcademico INT PRIMARY KEY IDENTITY(1,1),
    NombreDepartamento VARCHAR(100) NOT NULL,
    CodigoDepartamento VARCHAR(10) UNIQUE NOT NULL,
    Descripcion TEXT
);
GO

INSERT INTO DepartamentosAcademicos (NombreDepartamento, CodigoDepartamento, Descripcion) 
VALUES 
('Ciencias Exactas', 'CE01', 'Departamento de matemáticas y física'),
('Ciencias Sociales', 'CS02', 'Departamento de psicología y sociología'),
('Negocios', 'N03', 'Departamento de administración y finanzas');

-- Tabla de horarios
CREATE TABLE Horarios (
    IDHorario INT PRIMARY KEY IDENTITY(1,1),
    DiaSemana VARCHAR(20),
    HoraInicio TIME,
    HoraFin TIME,
    IDClase INT,
    IDProfesor INT,
    FOREIGN KEY (IDClase) REFERENCES Clases(IDClase) ON DELETE CASCADE,
    FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor) ON DELETE SET NULL
);
GO

INSERT INTO Horarios (DiaSemana, HoraInicio, HoraFin, IDClase, IDProfesor) 
VALUES 
('Lunes', '08:00', '10:00', 1, 1),
('Martes', '10:00', '12:00', 2, 2),
('Miércoles', '14:00', '16:00', 3, 3);


-- Tabla de inscripciones
CREATE TABLE Inscripciones (
    IDInscripcion INT PRIMARY KEY IDENTITY(1,1),
    IDEstudiante INT,
    IDClase INT,
    FechaInscripcion DATE,
    FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante) ON DELETE CASCADE,
    FOREIGN KEY (IDClase) REFERENCES Clases(IDClase) ON DELETE CASCADE
);
GO


INSERT INTO Inscripciones (IDEstudiante, IDClase, FechaInscripcion) 
VALUES 
(5, 4, '2024-12-01'),
(6, 5, '2024-12-02'),
(7, 6, '2024-12-03');

--HAZTA ACA ESTA EJECITADP EÑ CPDOGP


-- Relación de estudiantes con programas académicos
ALTER TABLE Estudiantes
ADD FOREIGN KEY (IDProgramaAcademico) REFERENCES ProgramasAcademicos(IDProgramaAcademico) ON DELETE SET NULL;
GO

-- Relación de profesores con departamentos académicos
ALTER TABLE Profesores
ADD FOREIGN KEY (IDDepartamentoAcademico) REFERENCES DepartamentosAcademicos(IDDepartamentoAcademico) ON DELETE SET NULL;
GO

-- Asegurar que no haya inscripciones duplicadas
ALTER TABLE Inscripciones
ADD CONSTRAINT UQ_EstudianteClase UNIQUE (IDEstudiante, IDClase);
GO


-- =======================
--  ALTER TABLE SAMPLES
-- =======================

-- Ejemplo de agregar una nueva columna a la tabla de estudiantes:
ALTER TABLE Estudiantes
ADD Edad INT;
GO

-- Ejemplo de modificar una columna existente (CorreoElectronico) en la tabla de estudiantes:
ALTER TABLE Estudiantes
ALTER COLUMN CorreoElectronico VARCHAR(150) NOT NULL;
GO

-- Ejemplo de eliminar una columna (Edad) en la tabla de estudiantes:
ALTER TABLE Estudiantes
DROP COLUMN Edad;
GO

-- Ejemplo de agregar una clave foránea en la tabla de profesores (si se olvidó antes):
ALTER TABLE Profesores
ADD CONSTRAINT FK_Profesores_Departamentos FOREIGN KEY (IDDepartamentoAcademico) REFERENCES DepartamentosAcademicos(IDDepartamentoAcademico);
GO

-- Ejemplo de eliminar una clave foránea en la tabla de profesores:
ALTER TABLE Profesores
DROP CONSTRAINT FK_Profesores_Departamentos;
GO

-- Ejemplo de modificación de una tabla para cambiar una columna con datos nulos:
-- Primero, llenar los datos nulos antes de hacer el cambio.
UPDATE Estudiantes
SET Edad = 18
WHERE Edad IS NULL;

-- Luego, hacer la columna NOT NULL
ALTER TABLE Estudiantes
ALTER COLUMN Edad INT NOT NULL;
GO

SELECT IDEstudiante, Nombre, Apellido 
FROM Estudiantes;

SELECT IDEstudiante, Nombre, Apellido, IDProgramaAcademico, CorreoElectronico 
FROM Estudiantes 
WHERE Nombre = 'Juan';

SELECT IDEstudiante, Nombre, Apellido 
FROM Estudiantes 
WHERE IDProgramaAcademico = 1;

select * from Inscripciones
