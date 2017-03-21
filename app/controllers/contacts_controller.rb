class ContactsController < ApplicationController
   # GET request to /Contactez-nous
   # Show new contact form
    def new
        @contact= Contact.new
    end
    # POST request /Contact
    
    def create
        # Mass assignment of form fiels into Contact Object 
        @contact = Contact.new(contact_params)
        # Save the contact object to the database 
        if @contact.save
            # Store form field via params into variables 
            name = params[:contact][:nom]
            email = params[:contact][:email]
            body = params[:contact][:commentaires]
            
            # Plug variables into the contact mailer
            # Email method and send email
            
            ContactMailer.contact_email(name, email, body).deliver 
            # Store succes message in flash hash
            # and redirect to the new action 
            flash[:success] = "Message Envoyé"
           redirect_to new_contact_path
        else
            
            # If Contact object doesn't save 
            # and redirect to the new action 
            flash[:danger] = @contact.errors.full_messages.join(", ")
             redirect_to new_contact_path
        end    
    end
    
    private 
   
    # To collect data from form, we need to use 
    # strong parameters and whitelist the formm field
    def contact_params
        params.require(:contact).permit(:nom, :email, :commentaires)
    end
end