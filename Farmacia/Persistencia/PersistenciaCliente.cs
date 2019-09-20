﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

using EntidadesCompartidas;
using Logica;

namespace Persistencia
{
    public class PersistenciaCliente
    {
        public static void Alta(Cliente oCli)
        {
            SqlConnection oConexion = new SqlConnection(Conexion.STR);
            SqlCommand oComando = new SqlCommand("AltaCliente", oConexion);
            oComando.CommandType = CommandType.StoredProcedure;

            oComando.Parameters.AddWithValue("@nomUsu", oCli.nomUsu);
            oComando.Parameters.AddWithValue("@pass", oCli.pass);
            oComando.Parameters.AddWithValue("@nombre", oCli.nombre);
            oComando.Parameters.AddWithValue("@apellido", oCli.apellido);
            oComando.Parameters.AddWithValue("@dirEntrega", oCli.dirEntrega);
            oComando.Parameters.AddWithValue("@telefono", oCli.Telefono);

            SqlParameter oParametro = new SqlParameter("@Retorno", SqlDbType.Int);
            oParametro.Direction = ParameterDirection.ReturnValue;
            oComando.Parameters.Add(oParametro);

            try
            {
                oConexion.Open();
                oComando.ExecuteNonQuery();

                int valReturn = (int)oComando.Parameters["@Retorno"].Value;

                if (valReturn == 1)
                    throw new Exception("Alta exitosa");
                if (valReturn == -1)
                    throw new Exception("Error SQL");
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                oConexion.Close();
            }
        }
    }
}