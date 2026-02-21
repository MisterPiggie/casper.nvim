local M = {}

function M.setup()
    if os.getenv("TERM_PROGRAM") ~= "ghostty" then return end 
    local colors = require("casper.parser").get_colors()
    require("casper.highlights").apply(colors)
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client then
                client.server_capabilities.semanticTokensProvider = nil
            end
        end,
    })
end

return M
