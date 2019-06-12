remotes::install_github("mrchypark/sendgridr")
library(sendgridr)
auth_set()

#set working directory

# send mail
mail() %>% 
  from("8renn2923@gmail.com", "kmseob") %>% 
  to("8renn2923@gmail.com", "kmseob") %>% 
  subject("DCinside") %>% 
  content("DCinside gallery")  %>% 
  ## attachments is optional
  attachments("sendemail.R") %>% 
  send()
