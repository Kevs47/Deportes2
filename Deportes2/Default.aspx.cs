using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Deportes2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nada adicional
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            AccessDataSource1.InsertParameters["deporte"].DefaultValue = txtDeporte.Text;
            AccessDataSource1.InsertParameters["Equipo A"].DefaultValue = txtEquipoA.Text;
            AccessDataSource1.InsertParameters["Equipo B"].DefaultValue = txtEquipoB.Text;
            AccessDataSource1.InsertParameters["resultados"].DefaultValue = txtResultados.Text;
            AccessDataSource1.InsertParameters["estadisticas"].DefaultValue = txtEstadisticas.Text;
            AccessDataSource1.InsertParameters["Fecha"].DefaultValue = txtFecha.Text;
            AccessDataSource1.InsertParameters["Hora"].DefaultValue = txtHora.Text;

            AccessDataSource1.Insert();
            GridView1.DataBind();

            // Limpiar campos
            txtDeporte.Text = txtEquipoA.Text = txtEquipoB.Text =
            txtResultados.Text = txtEstadisticas.Text = txtFecha.Text = txtHora.Text = string.Empty;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Encontrar cada TextBox dentro de EditItemTemplate
            string deporte = ((TextBox)row.FindControl("txtDeporteEdit")).Text;
            string equipoA = ((TextBox)row.FindControl("txtEquipoAEdit")).Text;
            string equipoB = ((TextBox)row.FindControl("txtEquipoBEdit")).Text;
            string resultados = ((TextBox)row.FindControl("txtResultadosEdit")).Text;
            string estadisticas = ((TextBox)row.FindControl("txtEstadisticasEdit")).Text;
            string fecha = ((TextBox)row.FindControl("txtFechaEdit")).Text;
            string hora = ((TextBox)row.FindControl("txtHoraEdit")).Text;

            // Obtener el Id de DataKeys
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            // Asignar parámetros y ejecutar Update
            AccessDataSource1.UpdateParameters["deporte"].DefaultValue = deporte;
            AccessDataSource1.UpdateParameters["Equipo A"].DefaultValue = equipoA;
            AccessDataSource1.UpdateParameters["Equipo B"].DefaultValue = equipoB;
            AccessDataSource1.UpdateParameters["resultados"].DefaultValue = resultados;
            AccessDataSource1.UpdateParameters["estadisticas"].DefaultValue = estadisticas;
            AccessDataSource1.UpdateParameters["Fecha"].DefaultValue = fecha;
            AccessDataSource1.UpdateParameters["Hora"].DefaultValue = hora;
            AccessDataSource1.UpdateParameters["Id"].DefaultValue = id;

            AccessDataSource1.Update();

            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
    }
}