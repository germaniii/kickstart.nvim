vim.lsp.config('groovyls', {
  root_markers = { '.git', 'build.gradle', 'pom.xml', 'settings.gradle' },
})
vim.lsp.enable('groovyls')
return {}
