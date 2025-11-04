# load libraries
library("shiny")
library("bslib")

# Define the Server (Backend)
server <- function(input, output) {
  
  # create reactives
  dna_seq <- reactive({
    gene_dna(length = input$n_bases, 
             base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  rna_seq <- reactive({
    transcribe_dna(dna = dna_seq())
  })
  prot_seq <- reactive({
    translate_rna(rna = rna_seq())
  })
  
  # create outputs
  output$dna <- renderText({
    dna_seq()
  })
  output$freqs <- renderTable({
    base_freqs(dna = dna_seq())
  })
  output$rna <- renderText({
    rna_seq()
  })
  output$protein <- renderText({
    prot_seq()
  })

}