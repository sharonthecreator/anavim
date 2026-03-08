require('minuet').setup({
    provider = 'claude',
    provider_options = {
        claude = {
            max_tokens = 512,
            -- Haiku: fast and cheap, ideal for inline completions
            model = 'claude-haiku-4-5',
            stream = true,
        },
    },
    -- Ghost text (Copilot-style inline suggestions)
    virtualtext = {
        auto_trigger_ft = { '*' },
        keymap = {
            accept = '<CR>',        -- Accept full suggestion
            accept_line = '<S-CR>', -- Accept one line
            next = '<Tab>',         -- Next suggestion
            prev = '<S-Tab>',       -- Previous suggestion
            dismiss = '<C-e>',      -- Dismiss
        },
    },
    throttle = 1500,
    debounce = 1000,
})
