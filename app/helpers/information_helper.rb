module InformationHelper
    def contact_id_setter(contact, information)
        if contact
            "<input id='contact_id' name='information[contact_id]' type='hidden' value=#{contact.id} />".html_safe
        elsif information.contact_id
            "<input id='contact_id' name='information[contact_id]' type='hidden' value=#{information.contact_id} />".html_safe
        end
    end
end
