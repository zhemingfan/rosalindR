#' Create a new question in the YAML format.
#'
#' This function allows users to creates a new question based on questions in the Rosalind platform.
#'
#' @param question_name A string indicating the name of the question.
#' @param question_path A string indicating the path to your question file.
#' @param author_name A string indicating the name of the author
#' @return Creates a .yaml file in the test directory containing the question name and author information. The file name is the question_name parameter.
#' Returns the file path of the newly created .yaml file.
#' @export
#' @examples create_question("Question 1 - Favorite nucleotide?", "~/.", "Jeremy Fan")

create_question <- function(question_name, question_path, author_name) {

  lesson_file <- file.path(question_path, paste0(question_name,".yaml"))
  fileConn<-file(lesson_file)
  writeLines(c("- Class: meta",
               paste("  Question:", question_name),
               paste("  Author:", author_name)), fileConn
            )
  close(fileConn)
  return(lesson_file)

}


