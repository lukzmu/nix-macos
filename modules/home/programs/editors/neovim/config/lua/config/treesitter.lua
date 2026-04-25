local M = {}

local html_script_type_languages = {
    importmap = "json",
    module = "javascript",
    ["application/ecmascript"] = "javascript",
    ["text/ecmascript"] = "javascript",
}

local markdown_injection_aliases = {
    ex = "elixir",
    pl = "perl",
    sh = "bash",
    ts = "typescript",
    uxn = "uxntal",
}

local function capture_node(match, capture_id)
    local node = match[capture_id]
    if type(node) == "table" then
        return node[1]
    end
    return node
end

local function capture_text(match, capture_id, bufnr, metadata)
    local node = capture_node(match, capture_id)
    if node == nil then
        return nil
    end

    local ok, text
    if metadata == nil then
        ok, text = pcall(vim.treesitter.get_node_text, node, bufnr)
    else
        ok, text = pcall(vim.treesitter.get_node_text, node, bufnr, { metadata = metadata })
    end

    if ok then
        return text
    end
    return nil
end

local function parser_from_markdown_info_string(injection_alias)
    local match = vim.filetype.match({ filename = "a." .. injection_alias })
    return match or markdown_injection_aliases[injection_alias] or injection_alias
end

function M.patch_query_directives()
    local query = require("vim.treesitter.query")

    -- Neovim 0.12 passes capture lists here; older nvim-treesitter code expects a single TSNode.
    query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
        local type_attr_value = capture_text(match, pred[2], bufnr)
        if type_attr_value == nil or type_attr_value == "" then
            return
        end

        local configured = html_script_type_languages[type_attr_value]
        if configured then
            metadata["injection.language"] = configured
        else
            local parts = vim.split(type_attr_value, "/", {})
            metadata["injection.language"] = parts[#parts]
        end
    end, { force = true })

    query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
        local injection_alias = capture_text(match, pred[2], bufnr)
        if injection_alias == nil or injection_alias == "" then
            return
        end

        metadata["injection.language"] = parser_from_markdown_info_string(injection_alias:lower())
    end, { force = true })

    query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
        local capture_id = pred[2]
        local capture_metadata = metadata[capture_id]
        local text = capture_text(match, capture_id, bufnr, capture_metadata) or ""

        if metadata[capture_id] == nil then
            metadata[capture_id] = {}
        end
        metadata[capture_id].text = string.lower(text)
    end, { force = true })
end

return M
