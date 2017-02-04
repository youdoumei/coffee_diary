# Never trust parameters from the scary internet, only allow the white list through.
   def picture_params
     params.require(:picture).permit(:name, :photo)
   end
