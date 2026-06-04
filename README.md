
> **Leader = `<Space>`**

---

## ⭐ Daily Drivers (React / RoR)

The stuff that actually makes the day faster.

### Git (gitsigns)
| Key | Action |
|-----|--------|
| `]c` / `[c` | Jump to **next / previous** changed hunk |
| `<leader>hp` | **Preview hunk** (inline diff popup) — quickest "what did I change here?" |
| `<leader>hd` | **Diff this file** against the git index |
| `<leader>hD` | Diff this file against **last commit** (`HEAD`) |
| `<leader>hs` | **Stage hunk** (works on a visual selection too) |
| `<leader>hr` | **Reset hunk** (discard changes in this hunk) |
| `<leader>hS` | Stage the **whole buffer** |
| `<leader>hR` | Reset the **whole buffer** |
| `<leader>hu` | Undo last stage hunk |
| `<leader>hb` | **Blame current line** (full, popup) |
| `<leader>tb` | Toggle inline **line blame** (always-on virtual text) |
| `<leader>tD` | Toggle showing **deleted** lines |

> 💡 Visual-mode `<leader>hs` / `<leader>hr` stage/reset only the selected lines — great for splitting a messy change into clean commits.

### Jump between related files (other.nvim)
| Key | Action |
|-----|--------|
| `<leader>o` | **Toggle to the "other" file** |

Configured for `rails`, `react`, `golang`, `rust`. In **Rails** this hops controller ↔ view ↔ model ↔ spec; in **React** it hops component ↔ style/test/story.

### LSP navigation (the bread & butter)
| Key | Action |
|-----|--------|
| `gd` | **Go to definition** (fzf picker, cwd-only, auto-jumps single result) |
| `gr` | **Go to references** |
| `gI` | Go to **implementation** |
| `gD` | Go to **declaration** (e.g. header / type decl) |
| `<leader>D` | Go to **type definition** |
| `<C-t>` | Jump **back** after a `gd` |
| `K` | Hover docs *(built-in LSP default)* |
| `<F2>` | **Rename** symbol (project-wide) |
| `<leader>ca` | **Code action** (quick-fix, import, etc.) |
| `<leader>c.` | **Source action** (e.g. organize imports) |
| `<leader>ds` | Document symbols (fuzzy) |
| `<leader>ws` | Workspace symbols (fuzzy) |

### Find anything (fzf-lua)
| Key | Action |
|-----|--------|
| `<leader>ff` | **Find files** (incl. hidden, ignores `.gitignore`) |
| `<leader>/` | **Live grep** the whole project |
| `<leader>sw` | Grep the **word under cursor** |
| `<leader>s.` | **Recent files** |
| `<leader>bl` | **Buffer list** |
| `<leader>sr` | **Resume** last search |
| `<leader>sd` | Search document diagnostics |

### Diagnostics (errors/warnings)
| Key | Action |
|-----|--------|
| `]d` / `[d` | Next / previous diagnostic |
| `<C-e>` / `<leader>e` | Show **floating** diagnostic for the line |
| `<leader>q` | Send all diagnostics to the **location list** |
| `<leader>ti` | **Toggle inline** virtual-text diagnostics (off by default) |

---

## 🗂️ Files, Buffers & Navigation

### File manager (yazi.nvim — replaces netrw)
| Key | Action |
|-----|--------|
| `<leader>-` | Open **yazi at the current file** |
| `<leader>cw` | Open yazi in the **working directory** |
| `<C-up>` | **Resume** last yazi session |
| `<F1>` | Help (inside yazi) |

### Buffers / tabline (barbar)
| Key | Action |
|-----|--------|
| `]b` / `[b` | Next / previous buffer |
| `bd` | **Close** current buffer |
| `bD` | Close **all buffers but current** |
| `<leader>bp` | **Pin** / unpin buffer |
| `<leader>bb` | **Pick** a buffer (jump-label mode) |
| `<A-1>` … `<A-9>` | Jump to buffer in position 1–9 |

### Windows / splits
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move focus left / down / up / right |
| Mouse | Resize splits (mouse mode is on) |

### Breadcrumbs (dropbar)
| Key | Action |
|-----|--------|
| `[;` | Go to **start of current context** |
| `];` | Select **next context** |

---

## ✏️ Editing Superpowers

### Search-and-replace word under cursor (multi-cursor style)
| Key | Action |
|-----|--------|
| `cn` | Change the next match of the word under cursor; repeat with `.` |
| `cN` | Same, but searching **backward** |
| (visual) `cn` / `cN` | Change next/prev match of the **selection** |

> Workflow: `cn` → type replacement → `<Esc>` → press `.` `.` `.` to apply to each following match. The poor man's multi-cursor.

### Surround (nvim-surround)
| Key                | Action                                                |
| ------------------ | ----------------------------------------------------- |
| `ys{motion}{char}` | **Add** surround (e.g. `ysiw"` → wrap word in quotes) |
| `ds{char}`         | **Delete** surround (`ds"`)                           |
| `cs{old}{new}`     | **Change** surround (`cs"'`)                          |

### Exchange / swap text (substitute.nvim)
| Key | Action |
|-----|--------|
| `sx{motion}` | Mark text to **exchange** |
| `sxx` | Mark the **whole line** to exchange |
| (visual) `;` | Exchange the visual selection |

> Use it to swap two function arguments: `sxiw` on the first, `sxiw` on the second.

### Comments (Comment.nvim)
| Key | Action |
|-----|--------|
| `<C-/>` | Toggle comment (line in normal, selection in visual) |
| `gcc` | Toggle line comment *(default)* |
| `gc{motion}` | Comment a motion *(default)* |

### Textobjects (mini.ai — smarter `i`/`a`)
| Example | Action |
|---------|--------|
| `va)` | Visually select **around** parens |
| `ci'` | Change **inside** quotes |
| `yinq` | Yank **inside next** quote |
| `dat` | Delete **around tag** (HTML/JSX) |

### Auto tags (nvim-ts-autotag)
Auto-closes and auto-renames HTML/JSX tags as you type (great for React). Typing `</` also auto-closes.

---

## 🧠 Treesitter Movement & Selection

### Incremental selection
| Key | Action |
|-----|--------|
| `gnn` | Start selection |
| `grn` | Expand to next **node** |
| `grc` | Expand to next **scope** |
| `grm` | Shrink node |

### Jump by code structure (treesitter-textobjects)
Pattern: `<leader>n…` = next start, `<leader>p…` = previous start. Capital suffix = jump to **end**.

| Suffix | Target |
|--------|--------|
| `b` / `B` | block |
| `f` / `F` | function |
| `c` / `C` | class |
| `i` / `I` | conditional (if) |
| `l` / `L` | loop |

Examples: `<leader>nf` → next function start · `<leader>pf` → previous function start · `<leader>nF` → next function end.

### Sticky context (treesitter-context)
| Key | Action |
|-----|--------|
| `<leader>tc` | Toggle the sticky scope header (off by default) |

---

## 🔁 Project-wide Find & Replace (nvim-spectre)

Spectre uses `rg` to find and `sd` to replace. Launch it via `:Spectre` (no default keymap set in config). Inside the panel you edit search/replace/path lines, then run the replace. Pairs well with `<leader>/` for quick greps and Spectre for the heavy rewrites.

---

## 🤖 Completion (nvim-cmp) — manual trigger!

> **Autocomplete does NOT pop up automatically.** Trigger it yourself.

| Key | Action |
|-----|--------|
| `<C-Space>` | **Trigger** completion menu |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<CR>` or `<C-y>` | **Accept** the selected item (auto-imports if supported) |
| `<C-b>` / `<C-f>` | Scroll docs up / down |
| `<C-l>` / `<C-h>` | Jump forward / back through **snippet** placeholders |

---

## 📋 Quickfix (nvim-bqf)
Enhanced quickfix with a live preview window (auto-enabled). Open the quickfix via `<leader>q` (diagnostics) or any command that fills it, then navigate entries with preview. Press `q` to close.

---

## 🎨 Misc UI / Utility Commands

| Command / Key | Action |
|---------------|--------|
| `<Esc>` | Clear search highlight |
| `:ColorizerToggle` | Show hex/rgb colors inline (CSS/Tailwind handy) |
| `q` | Close help/quickfix/notify/etc. utility windows |
| `:FixWeirdChars` | Replace smart-quotes/nbsp/zero-width chars (PDF paste cleanup) |
| `:Redir <cmd>` | Dump a command's output into a new buffer |
| `:Mason` | Manage LSP servers / tools |
| `:Lazy` | Plugin manager UI (update/profile) |
| `:ConformInfo` | Inspect active formatters |
| `<leader>sn` | Search Neovim config files |
| `<leader>fed` | Open `init.lua` directly |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |

### which-key
Just **pause after `<leader>`** (zero delay) and a popup shows all available follow-up keys. Groups: `c` Code · `d` Document · `r` Rename · `s` Search · `w` Workspace · `t` Toggle · `h` Git Hunk.

---

## ⚙️ Behaviors That Run Automatically

- **Format on save** — lua→stylua, ruby→rubocop (`-a` autocorrect); everything else falls back to LSP formatting (except C/C++).
- **Highlight on yank** — flashes copied text.
- **Restore cursor** to last position when reopening a file.
- **Auto-create directories** on save if the path doesn't exist.
- **Sessions auto-restore** in git repos, `~/dev`, and `~/.config`.
- **Wrap + spellcheck** in markdown / text / gitcommit.
- System clipboard is synced (`unnamedplus`) — `y`/`p` use the OS clipboard.

---

## 🌿 LSP Servers Configured
`lua_ls` · `ts_ls` (JS/TS, roots on `package.json`) · `ruby_lsp` · `denols` (disabled by default). Mason auto-installs them. For Ruby, formatting is **rubocop** via conform.

---

## Terminal
| Key | Action |
|-----|--------|
| `<Esc><Esc>` | Exit terminal mode |
