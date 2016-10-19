command! MarkdownPreview !pandoc -s --toc %:p -o /tmp/markdown-preview.html <CR>
command! MarkdownThis <Esc>:set filetype=markdown<CR>
command! MarkdownErrorFree <Esc>:hi link markdownError normal<CR>


