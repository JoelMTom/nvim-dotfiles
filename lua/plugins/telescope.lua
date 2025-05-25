return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
    },
    cmd = { "Telescope", },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            }
        }
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope help tags",
        },
        {
            "<C-p>",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Telescope git files",
        },
        {
            "<leader>fd",
            function()
                require("telescope.builtin").fd()
            end
        }
    },
    config = function()
        require("telescope").load_extension("fzf")
    end
}
