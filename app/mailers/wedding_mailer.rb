class WeddingMailer < ApplicationMailer

  def wedding_email
    @wedding = Wedding.find(params[:wedding].id)

    xlsx = render layout: false, handlers: [:axlsx], formats: [:xlsx], template: "weddings/show", locals: { :wedding => @wedding }
    attachments[@wedding.wedding_name + '.xlsx'] = {mime_type: Mime[:xlsx], content: xlsx}
    mail(to: 'davidagud@gmail.com', subject: @wedding.wedding_name)
  end

end
