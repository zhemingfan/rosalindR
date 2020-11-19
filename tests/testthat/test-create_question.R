test_that("Checking whether input has consistent content compared to a test file...", {
  local_path <- create_question("Question1", "~/.", "Jeremy Fan")

  lesson_file <- file.path("~/.", paste0("Question_test.yaml"))
  fileConn<-file(lesson_file)
  writeLines(c("- Class: meta",
               paste("  Question: Question1"),
               paste("  Author: Jeremy Fan")), fileConn
  )

  failed_path <- create_question("Question_failed", "~/.", "Jeremy Fan")

  ## First unit test: two identical files should have same hashes. Hashes can be used to compare content in a file.
  expect_identical(as.vector(tools::md5sum(local_path)) , as.vector(tools::md5sum(lesson_file)))

  ## Second unit test: two differ files should have same hashes.
  expect_error(expect_identical(as.vector(tools::md5sum(local_path)) , as.vector(tools::md5sum(failed_path))),"as.vector(tools::md5sum(local_path)) not identical to as.vector(tools::md5sum(failed_path)).\n1/1 mismatches\nx[1]: \"3454a07b2701041bb2256dedaeadf899\"\ny[1]: \"81f842aaa1d74c67731b406f3582018d\"", fixed=TRUE)

  ## Remove intermediate files.
  if (file.exists(lesson_file)) {
    file.remove(lesson_file)
  }

  if (file.exists(local_path)) {
    file.remove(local_path)
  }

  if (file.exists(failed_path)) {
    file.remove(failed_path)
  }
})

test_that("Checking whether input has consistent number of arguments...", {

  ## First unit test: incomplete number of arguments (missing author arguments)
  expect_error(create_question("Question1", "~/.") , "argument \"author_name\" is missing, with no default", fixed=TRUE)

})
