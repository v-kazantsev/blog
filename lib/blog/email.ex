defmodule Blog.Email do
  import Bamboo.Email

  def feedback(from, email, message) do
    new_email(
      from: "postmaster@sandbox4b4b28bad9d1470b9821ede5e785c348.mailgun.org",
      to: "d.ortega1667@gmail.com",
      subject: "Feedback from #{from}: #{email} recieved",
      html_body: message
    )
  end
end
