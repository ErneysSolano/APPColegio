/******************************************************
*     FECHA: 25-01-2026          
*     AUTOR: Erneys Solano
*     ACCION: crear SP eliminar colegio
*     
*     DESCRIPCION:
*     Se realiza procedimimeto alamcenado para 
*     eliminar el colegio
*
******************************************************/

use DBColegio
go

alter procedure sp_eliminar_colegio
@nit bigint,
@resultCode int output,
@resultMsg nvarchar(200) output
as
begin

     set nocount on;

     begin try
       if not exists (select 1 from Tbl_Colegio where nit = @nit)
       begin 
           set @resultCode = 404;
           set @resultMsg = 'El colegio con ese Nit no existe';
           return;
       end

       delete from Tbl_Colegio where nit = @nit;

       if @@ROWCOUNT = 0
       Begin 
           set @resultCode = 500;
           set @resultMsg = 'No se puede eliminar el colegio';
       end
       else
       begin 
           set @resultCode = 200;
           set @resultMsg = 'Colegio eliminado exitosamente';
       end
    end try
    begin catch 
          set @resultCode = ERROR_NUMBER();
          set @resultMsg = ERROR_MESSAGE();
    end catch
end
go
           
