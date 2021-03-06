% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_info.R
\name{get_info}
\alias{get_info}
\title{Retrieve descriptive information from ENGIE's open wind farm}
\usage{
get_info(...)
}
\arguments{
\item{...}{Additional parameters to be passed to \code{\link[httr]{GET}}.}
}
\value{
The dataset downloaded is returned invisibly.
}
\description{
The \code{\link[openwindfarm]{get_info}} function downloads the dataset
describing the 34 measurements that compose the .
}
\seealso{
\code{\link[openwindfarm]{get_owf}}.
}
