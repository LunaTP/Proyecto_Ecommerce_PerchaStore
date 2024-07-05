<%@ include file="components/head.jsp"%>
<%@ include file="components/nav.jsp"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sign Up</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <link rel="stylesheet" type="text/css" href="login.css">
    	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
    <script>
        $(document).ready(function () {
            $("#registrationForm").submit(function () {
                var edadInput = $("#EdadUsuario").val();
                var sexoInput = $("#SexoUsuario").val();

                if (!/^\d+$/.test(edadInput)) {
                    alert("Por favor, ingresa una edad válida.");
                    return false;
                }

                var edad = parseInt(edadInput);

                if (isNaN(edad) || edad < 18) {
                    alert("¡Debes ser mayor de 18 años para registrarte!");
                    return false;
                }

                // Verificar que el sexo sea "F" o "M"
                if (!(sexoInput.toUpperCase() === "F" || sexoInput.toUpperCase() === "M")) {
                    alert("Por favor, ingresa 'F' para femenino o 'M' para masculino en el campo Sexo.");
                    return false;
                }

                return true;
            });
        });
    </script>
	<body>
		<div class="sss col-lg-3">
			<form id="registrationForm" action="grabarUsuario">
				<input type="hidden" name="op" value="3" />
				<div class="form-group text-center">
					<i class="fa-solid fa-user fa-lg"></i>
					<p><strong>Registrate en nuestro Sitio WEB</strong></p>
				</div>
				<div class="form-group">
			        <label for="ApellidoUsuario">Apellidos:</label>
			        <input class="form-control" type="text" id="ApellidoUsuario" name="txtape" maxlength="50" required placeholder="Ingrese Apellidos">
		        </div>
				<div class="form-group">
			        <label for="NombreUsuario">Nombre:</label>
			        <input class="form-control" type="text" id="NombreUsuario" name="txtnom" maxlength="50" required placeholder="Ingrese Nombre">
		        </div>	
				<div class="form-group">
			        <label for="EdadUsuario">Edad:</label>
			        <input class="form-control" type="text" id="EdadUsuario" name="txteda" maxlength="2" required placeholder="Ingrese Edad">
		        </div>
				<div class="form-group">
			        <label for="SexoUsuario">Sexo:</label>
			        <input class="form-control" type="text" id="SexoUsuario" name="txtsex" maxlength="1" required placeholder="F or M">
		        </div>
		        <div class="form-group">
			        <label for="ContraUsuario">Contraseña:</label>
			        <input class="form-control" type="password" id="ContraUsuario" name="txtcontra" maxlength="50" required>
		        </div>
				<input class="btn btn-danger btn-block" type="submit" value="Registrarse" />
			</form>
	
		</div>
	</body>
	
<%@ include file="components/footer.jsp"%>
</html>