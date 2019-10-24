﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EntidadesCompartidas;
using Logica;

public partial class ABMMedicamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            this.LimpioFormulario();
        }
    }

    protected void ActivoBotonesBM()
        {
            btnModificar.Enabled = true;
            btnEliminar.Enabled = true;

            btnBuscar.Enabled = false;
            btnAlta.Enabled = false;

            txtRucMedicamento.Enabled = false;
            txtCodMedicamento.Enabled = false;

            txtNombreMed.Enabled = true;
            txtDescripcion.Enabled = true;
            txtPrecio.Enabled = true;
        }

    protected void ActivoBotonesA()
    {
        btnModificar.Enabled = false;
        btnEliminar.Enabled = false;

        btnBuscar.Enabled = true;
        btnAlta.Enabled = true;

        txtRucMedicamento.Enabled = false;
        txtCodMedicamento.Enabled = false;
    }

    protected void LimpioFormulario()
    {
        btnAlta.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;

        btnBuscar.Enabled = true;

        txtRucMedicamento.Enabled = true;
        txtCodMedicamento.Enabled = true;

        txtNombreMed.Enabled = false;
        txtDescripcion.Enabled = false;
        txtPrecio.Enabled = false;

        txtRucMedicamento.Text = "";
        txtCodMedicamento.Text = "";
        txtNombreMed.Text = "";
        txtDescripcion.Text = "";
        txtPrecio.Text = "";

        lblError.Text = "";
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            Int64 oRUC = Convert.ToInt64(txtRucMedicamento.Text.Trim());
            int oCodigo = Convert.ToInt32(txtCodMedicamento.Text.Trim());

            Medicamento oMed = Logica.LogicaMedicamento.Buscar(oRUC, oCodigo);

            if(oMed != null)
            {
                this.ActivoBotonesBM();

                txtRucMedicamento.Text = Convert.ToString(oRUC);
                txtCodMedicamento.Text = Convert.ToString(oCodigo);
                txtNombreMed.Text = Convert.ToString(oMed.Nombre);
                txtDescripcion.Text = Convert.ToString(oMed.Descripcion);
                txtPrecio.Text = Convert.ToString(oMed.Precio);

                Session["MedicamentoABM"] = oMed;

                lblError.Text = "";
            }
            else
            {
                this.ActivoBotonesA();
                Session["MedicamentoABM"] = null;
            }
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            Int64 oRUC = Convert.ToInt64(txtRucMedicamento.Text.Trim());
            Farmaceutica oFar = LogicaFarmaceutica.Buscar(oRUC);

            Medicamento oMed = new Medicamento(oFar, Convert.ToInt32(txtCodMedicamento.Text.Trim()), txtNombreMed.Text.Trim(), txtDescripcion.Text.Trim(), Convert.ToInt32(txtPrecio.Text.Trim()));

            LogicaMedicamento.Alta(oMed);

            lblError.Text = "Alta exitosa";
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Medicamento oMed = null;
            oMed = (Medicamento)Session["MedicamentoABM"];

            oMed.Nombre = txtNombreMed.Text.Trim();
            oMed.Descripcion = txtDescripcion.Text.Trim();
            oMed.Precio = Convert.ToInt32(txtPrecio.Text.Trim());

            Logica.LogicaMedicamento.Modificar(oMed);

            this.LimpioFormulario();

            lblError.Text = "Modificacion exitosa";
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Medicamento oMed = (Medicamento)Session["MedicamentoABM"];

            LogicaMedicamento.Eliminar(oMed.Far.ruc, oMed.Codigo);

            this.LimpioFormulario();

            lblError.Text = "Eliminacion exitosa";
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        this.LimpioFormulario();
    }
}