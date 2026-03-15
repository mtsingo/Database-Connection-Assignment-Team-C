
import tkinter as tk
from tkinter import ttk


QUERY_PANELS = [
    {
        "id": 1,
        "title": "Students in a Course",
        "description": "Find all students enrolled in a specific course by a lecturer.",
        "fields": [
            {"label": "Course Name", "type": "entry"},
            {"label": "Lecturer Name", "type": "entry"},
        ],
    },
    {
        "id": 2,
        "title": "High-Grade Final-Year Students",
        "description": "List final-year students with an average grade above a threshold.",
        "fields": [
            {"label": "Minimum Average Grade (%)", "type": "spinbox",
             "from_": 0, "to": 100, "default": 70},
        ],
    },
    {
        "id": 3,
        "title": "Unenrolled Students",
        "description": "Identify students who are not registered for any courses.",
        "fields": [],
    },
    {
        "id": 4,
        "title": "Lecturers by Expertise",
        "description": "Search for lecturers with expertise in a particular research area.",
        "fields": [
            {"label": "Area of Expertise", "type": "entry"},
        ],
    },
    {
        "id": 5,
        "title": "Courses by Department",
        "description": "List all courses taught by lecturers in a specific department.",
        "fields": [
            {"label": "Department Name", "type": "entry"},
        ],
    },
    {
        "id": 6,
        "title": "Top Research Supervisors",
        "description": "Identify lecturers who have supervised the most research projects.",
        "fields": [],
    },
    {
        "id": 7,
        "title": "Staff by Department",
        "description": "Find all non-academic staff members in a specific department.",
        "fields": [
            {"label": "Department Name", "type": "entry"},
        ],
    },
]


class App(tk.Tk):

    def __init__(self):
        super().__init__()

        self.title("University Record Management System")
        self.geometry("1000x650")
        self.minsize(800, 500)
        self.configure(bg="black")

        self._active_id = tk.IntVar(value=1)
        self._field_vars = {}
        self._nav_buttons = {}

        self._build_layout()
        self._load_panel(1)

    # ------------------------------------------------------------------
    # Layout
    # ------------------------------------------------------------------

    def _build_layout(self):
        """Build the two-column layout: sidebar | main."""
        self.columnconfigure(1, weight=1)
        self.rowconfigure(0, weight=1)

        self._build_sidebar()
        self._build_main()

    def _build_sidebar(self):
        """Left column: app title + query list."""
        sidebar = tk.Frame(self, bg="white", width=220)
        sidebar.grid(row=0, column=0, sticky="ns")
        sidebar.grid_propagate(False)
        sidebar.columnconfigure(0, weight=1)

        # App title
        tk.Label(
            sidebar,
            text="UniRMS",
            font=("Courier", 14, "bold"),
            bg="black", fg="white",
            pady=12,
        ).grid(row=0, column=0, sticky="ew")

        tk.Label(
            sidebar,
            text="Record Management System",
            font=("Courier", 8),
            bg="black", fg="gray",
            pady=2,
        ).grid(row=1, column=0, sticky="ew")

        # Divider
        tk.Frame(sidebar, bg="gray", height=1).grid(
            row=2, column=0, sticky="ew", pady=(8, 4)
        )

        # Navigation buttons
        for i, panel in enumerate(QUERY_PANELS):
            btn = tk.Button(
                sidebar,
                text=f"  {panel['id']}. {panel['title']}",
                font=("Courier", 9),
                bg="black", fg="black",
                activebackground="black", activeforeground="white",
                bd=0, anchor="w", padx=10, pady=8,
                cursor="hand2",
                wraplength=200, justify="left",
                command=lambda pid=panel["id"]: self._load_panel(pid),
            )
            btn.grid(row=3 + i, column=0, sticky="ew")
            self._nav_buttons[panel["id"]] = btn

        # Bottom label
        tk.Frame(sidebar, bg="gray", height=1).grid(
            row=20, column=0, sticky="ew", pady=(8, 0)
        )
        tk.Label(
            sidebar,
            text="",
            font=("Courier", 7),
            bg="black", fg="gray",
            pady=8,
        ).grid(row=21, column=0)

    def _build_main(self):
        """Right column: query controls on top, results table below."""
        self._main = tk.Frame(self, bg="white")
        self._main.grid(row=0, column=1, sticky="nsew")
        self._main.columnconfigure(0, weight=1)
        self._main.rowconfigure(2, weight=1)

        # --- Controls area ---
        self._ctrl = tk.Frame(self._main, bg="white", padx=24, pady=18)
        self._ctrl.grid(row=0, column=0, sticky="ew")
        self._ctrl.columnconfigure(0, weight=1)

        self._lbl_title = tk.Label(
            self._ctrl,
            text="",
            font=("Courier", 14, "bold"),
            bg="white", fg="black",
            anchor="w",
        )
        self._lbl_title.grid(row=0, column=0, sticky="ew")

        self._lbl_desc = tk.Label(
            self._ctrl,
            text="",
            font=("Courier", 9),
            bg="white", fg="gray",
            anchor="w", wraplength=680, justify="left",
        )
        self._lbl_desc.grid(row=1, column=0, sticky="ew", pady=(2, 12))

        # Fields frame (rebuilt per panel)
        self._fields_frame = tk.Frame(self._ctrl, bg="white")
        self._fields_frame.grid(row=2, column=0, sticky="ew")

        # Run button
        self._btn_run = tk.Button(
            self._ctrl,
            text="Run Query",
            font=("Courier", 10, "bold"),
            bg="black", fg="black",
            activebackground="black", activeforeground="white",
            bd=0, padx=16, pady=6,
            cursor="hand2",
            command=self._on_run,
        )
        self._btn_run.grid(row=3, column=0, sticky="w", pady=(12, 0))

        # --- Divider ---
        tk.Frame(self._main, bg="black", height=1).grid(
            row=1, column=0, sticky="ew"
        )

        # --- Results area ---
        results = tk.Frame(self._main, bg="white")
        results.grid(row=2, column=0, sticky="nsew", padx=18, pady=14)
        results.columnconfigure(0, weight=1)
        results.rowconfigure(1, weight=1)

        # Status bar
        self._status_var = tk.StringVar(
            value="Select a query from the left, then press Run Query."
        )
        tk.Label(
            results,
            textvariable=self._status_var,
            font=("Courier", 8),
            bg="white", fg="gray",
            anchor="w",
        ).grid(row=0, column=0, sticky="ew", pady=(0, 6))

        # Treeview + scrollbars
        tree_frame = tk.Frame(results, bg="white")
        tree_frame.grid(row=1, column=0, sticky="nsew")
        tree_frame.columnconfigure(0, weight=1)
        tree_frame.rowconfigure(0, weight=1)

        style = ttk.Style(self)
        style.theme_use("default")
        style.configure(
            "Plain.Treeview",
            background="white",
            fieldbackground="white",
            foreground="black",
            rowheight=24,
            font=("Courier", 9),
        )
        style.configure(
            "Plain.Treeview.Heading",
            background="black",
            foreground="white",
            font=("Courier", 9, "bold"),
            relief="flat",
        )
        style.map(
            "Plain.Treeview",
            background=[("selected", "white")],
            foreground=[("selected", "black")],
        )

        self._tree = ttk.Treeview(
            tree_frame,
            style="Plain.Treeview",
            show="headings",
            selectmode="browse",
        )
        self._tree.grid(row=0, column=0, sticky="nsew")

        vsb = ttk.Scrollbar(tree_frame, orient="vertical",
                             command=self._tree.yview)
        vsb.grid(row=0, column=1, sticky="ns")

        hsb = ttk.Scrollbar(tree_frame, orient="horizontal",
                             command=self._tree.xview)
        hsb.grid(row=1, column=0, sticky="ew")

        self._tree.configure(
            yscrollcommand=vsb.set,
            xscrollcommand=hsb.set,
        )

        # Placeholder columns so table is visible on startup
        self._set_placeholder_columns()


    def _load_panel(self, panel_id: int):
        """Switch the right panel to the selected query."""
        self._active_id.set(panel_id)
        self._update_nav_highlight(panel_id)

        panel = next(p for p in QUERY_PANELS if p["id"] == panel_id)

        self._lbl_title.configure(text=f"Query {panel['id']}: {panel['title']}")
        self._lbl_desc.configure(text=panel["description"])

        # Rebuild input fields
        for widget in self._fields_frame.winfo_children():
            widget.destroy()
        self._field_vars.clear()

        for col, field in enumerate(panel["fields"]):
            tk.Label(
                self._fields_frame,
                text=field["label"] + ":",
                font=("Courier", 9, "bold"),
                bg="white", fg="black",
            ).grid(row=0, column=col * 2, sticky="w", padx=(0, 6))

            if field["type"] == "entry":
                var = tk.StringVar()
                entry = tk.Entry(
                    self._fields_frame,
                    textvariable=var,
                    font=("Courier", 9),
                    bd=1, relief="solid", width=22,
                )
                entry.grid(row=0, column=col * 2 + 1, padx=(0, 20))
                self._field_vars[field["label"]] = var

            elif field["type"] == "spinbox":
                var = tk.IntVar(value=field.get("default", 50))
                spin = tk.Spinbox(
                    self._fields_frame,
                    textvariable=var,
                    from_=field.get("from_", 0),
                    to=field.get("to", 100),
                    font=("Courier", 9),
                    bd=1, relief="solid", width=8,
                )
                spin.grid(row=0, column=col * 2 + 1, padx=(0, 20))
                self._field_vars[field["label"]] = var

        self._clear_table()
        self._status_var.set(
            f"Query {panel_id} loaded. Press 'Run Query' to execute."
        )

    def _update_nav_highlight(self, selected_id: int):
        """Underline the active nav button only — no color changes."""
        for pid, btn in self._nav_buttons.items():
            if pid == selected_id:
                btn.configure(font=("Courier", 9, "bold underline"))
            else:
                btn.configure(font=("Courier", 9))


    def _on_run(self):
        """Placeholder handler - query execution not yet connected."""
        panel_id = self._active_id.get()
        panel = next(p for p in QUERY_PANELS if p["id"] == panel_id)

        vals = {label: var.get() for label, var in self._field_vars.items()}

        self._clear_table()
        self._status_var.set(
            f"Query {panel_id}: '{panel['title']}' - "
            f"query execution not yet connected."
        )

        # Show placeholder row
        self._tree["columns"] = ("info",)
        self._tree.heading("info", text="Status")
        self._tree.column("info", width=700, anchor="w")
        self._tree.insert(
            "", "end",
            values=(
                f"[Placeholder] Query {panel_id} would run here. "
                f"Fields: {vals if vals else 'none'}",
            ),
        )

    # ------------------------------------------------------------------
    # Table helpers
    # ------------------------------------------------------------------

    def _clear_table(self):
        self._tree.delete(*self._tree.get_children())
        self._tree["columns"] = ()

    def _set_placeholder_columns(self):
        """Show empty column headers on first load."""
        cols = ["Student ID", "Name", "Course", "Grade (%)"]
        self._tree["columns"] = cols
        for col in cols:
            self._tree.heading(col, text=col)
            self._tree.column(col, width=140, anchor="w")


def main():
    app = App()
    app.mainloop()


if __name__ == "__main__":
    main()