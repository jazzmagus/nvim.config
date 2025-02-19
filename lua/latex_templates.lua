local M = {}

function M.choose_latex_template()
  local templates_path = vim.fn.expand("~/.config/nvim/latex-templates/")
  local templates = {
    "verifica_tpl.tex",
    "programmazione_tpl.tex",
    "beamer_lesson_tpl.tex",
    "trig_formule.tex",
    "diario_chapter.tex",
  }

  vim.ui.select(templates, { prompt = "Select LaTeX Template:" }, function(choice)
    if choice then
      local template_file = templates_path .. choice
      if vim.fn.filereadable(template_file) == 1 then
        vim.cmd("silent! r " .. template_file) -- Inserisce il template nel buffer corrente
        print("Template " .. choice .. " inserito!")
      else
        print("Errore: il file del template non esiste.")
      end
    end
  end)
end

return M
