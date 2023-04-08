function setBackgroundColor(color)
    color=color or 'kanagawa-wave'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal",{bg="none"})
    vim.api.nvim_set_hl(0, "NormalFloat",{bg="none"})

    -- Set the color of the column numbers
    --vim.cmd('highlight LineNr ctermfg=214 guifg=#FF9E3B')

    -- Set the color of the cursor line
    --vim.cmd('highlight CursorLine guibg=#FF9E3B')

end

setBackgroundColor()
