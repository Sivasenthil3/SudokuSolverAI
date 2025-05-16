import subprocess
import re
import time
import tkinter as tk

def run_prolog_solver():
    cmd = ['swipl', '-q', '-s', 'solver.pl', '-g', 'test', '-t', 'halt']
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    
    steps = []
    for line in result.stdout.splitlines():
        line = line.strip()
        m_try = re.match(r'try\((\d+),(\d+),(\d+)\)\.', line)
        m_back = re.match(r'backtrack\((\d+),(\d+),(\d+)\)\.', line)
        if m_try:
            row, col, val = map(int, m_try.groups())
            steps.append(('try', row - 1, col - 1, val))
        elif m_back:
            row, col, val = map(int, m_back.groups())
            steps.append(('backtrack', row - 1, col - 1, val))
    return steps

def animate_sudoku(steps):
    root = tk.Tk()
    root.title("Animated Sudoku Solver with Backtracking")

    grid = [[tk.Label(root, text='', width=4, height=2, font=('Arial', 18), relief='ridge', borderwidth=2) 
             for _ in range(9)] for _ in range(9)]

    for r in range(9):
        for c in range(9):
            grid[r][c].grid(row=r, column=c)

    def update_cell(index):
        if index >= len(steps):
            return
        action, r, c, val = steps[index]

        if action == 'try':
            print(f"TRY: row={r+1}, col={c+1}, val={val}")  # ← terminal print
            grid[r][c]['text'] = str(val)
            grid[r][c]['bg'] = 'lightgreen'
        else:  # backtrack
            print(f"BACKTRACK: row={r+1}, col={c+1}, val={val}")  # ← terminal print
            grid[r][c]['text'] = ''
            grid[r][c]['bg'] = 'lightcoral'
            root.after(150, lambda: grid[r][c].config(bg='SystemButtonFace'))

        root.after(150, update_cell, index + 1)

    update_cell(0)
    root.mainloop()


if __name__ == '__main__':
    print("Running Prolog solver with backtracking steps...")
    solving_steps = run_prolog_solver()
    print(f"Total steps: {len(solving_steps)}")
    animate_sudoku(solving_steps)
