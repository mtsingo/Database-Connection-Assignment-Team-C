import tkinter as tk
from tkinter import ttk, messagebox
from query_runner import run_query

QUERIES = {
    "Students in a course taught by a lecturer": [
        ("LecturerFirstName", "e.g., Charles"),
        ("LecturerLastName", "e.g., Evans"),
        ("CourseName", "e.g., Mechanics"),
    ],
    "Lecturers by expertise": [
        ("Expertise", "e.g., Databases"),
    ],
    "Courses by department": [
        ("Department", "e.g., Biology"),
    ],
    "Staff by department": [
        ("Department", "e.g., Chemistry"),
    ],
    "Lecturers by research project": [
        ("ProjectTitle", "e.g., Quantum Materials Simulation"),
    ],
}


class App(tk.Tk):
    """
    Graphical user interface for executing predefined
    database queries for the University RMS system.
    """

    def __init__(self):
        """
        Initialise the main application window and prepare
        the query interface components.
        """
        super().__init__()
        self.title("University RMS - Query Interface")
        self.geometry("900x520")

        self.query_var = tk.StringVar(value=list(QUERIES.keys())[0])
        self.param_entries = {}

        self._build_ui()
        self._render_param_fields()

    def _build_ui(self):
        """
        Build the main GUI layout including query selection,
        parameter inputs, and results table.
        """
        top = ttk.Frame(self, padding=12)
        top.pack(fill="x")

        ttk.Label(top, text="Select Query:").pack(side="left")
        self.query_combo = ttk.Combobox(
            top,
            textvariable=self.query_var,
            values=list(QUERIES.keys()),
            state="readonly",
            width=45,
        )
        self.query_combo.pack(side="left", padx=8)
        self.query_combo.bind("<<ComboboxSelected>>", lambda _e: self._render_param_fields())

        ttk.Button(top, text="Run", command=self._run_query).pack(side="left", padx=8)
        ttk.Button(top, text="Clear", command=self._clear_results).pack(side="left")

        self.params_frame = ttk.LabelFrame(self, text="Parameters", padding=12)
        self.params_frame.pack(fill="x", padx=12, pady=8)

        results_frame = ttk.LabelFrame(self, text="Results", padding=12)
        results_frame.pack(fill="both", expand=True, padx=12, pady=8)

        self.tree = ttk.Treeview(results_frame, show="headings")
        self.tree.pack(fill="both", expand=True, side="left")

        scroll = ttk.Scrollbar(results_frame, orient="vertical", command=self.tree.yview)
        scroll.pack(fill="y", side="right")
        self.tree.configure(yscrollcommand=scroll.set)

    def _render_param_fields(self):
        """
        Dynamically render parameter input fields depending
        on the selected query.
        """
        for w in self.params_frame.winfo_children():
            w.destroy()
        self.param_entries.clear()

        query_name = self.query_var.get()
        fields = QUERIES.get(query_name, [])

        if not fields:
            ttk.Label(self.params_frame, text="No parameters required.").pack(anchor="w")
            return

        for key, hint in fields:
            row = ttk.Frame(self.params_frame)
            row.pack(fill="x", pady=4)

            ttk.Label(row, text=f"{key}:", width=18).pack(side="left")
            entry = ttk.Entry(row, width=40)
            entry.pack(side="left", padx=6)
            ttk.Label(row, text=hint).pack(side="left")
            self.param_entries[key] = entry

    def _run_query(self):
        """
        Execute the selected query using the parameters
        provided by the user and display the results.
        """
        query_name = self.query_var.get()
        params = {k: e.get().strip() for k, e in self.param_entries.items()}

        for k, v in params.items():
            if not v:
                messagebox.showerror("Missing parameter", f"Please fill: {k}")
                return

        try:
            headers, rows = run_query(query_name, params)
            self._show_results(headers, rows)
        except Exception as e:
            messagebox.showerror("Query Error", str(e))

    def _clear_results(self):
        """
        Clear the results table.
        """
        self.tree.delete(*self.tree.get_children())
        self.tree["columns"] = []

    def _show_results(self, headers, rows):
        """
        Display query results in the table widget.
        """
        self._clear_results()
        self.tree["columns"] = headers

        for h in headers:
            self.tree.heading(h, text=h)
            self.tree.column(h, width=160, anchor="w")

        for r in rows:
            self.tree.insert("", "end", values=r)


if __name__ == "__main__":
    app = App()
    app.mainloop()