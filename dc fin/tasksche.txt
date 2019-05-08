library(taskscheduleR)

## file path
DC_data <- file.path("D:", "dcfinvv.R")

## Run every 01:00
taskscheduler_create(taskname = "DC_data00", rscript = DC_data, 
                     schedule = "DAILY", starttime = "01:00", startdate = format(Sys.Date()+1, "%Y/%m/%d"))

## delete
taskscheduler_delete(taskname = "DC_data00")
