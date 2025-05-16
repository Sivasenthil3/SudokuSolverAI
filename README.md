# 🧠 Sudoku Solver AI - Animated Logic Solver

Welcome to **Sudoku Solver AI**, an intelligent and aesthetic solver that combines **Prolog’s powerful constraint logic programming** with a **Python-based animated visualization** of the solving process.

![Sudoku Animation Preview](preview.gif)

---

## ✨ Features

- 🔢 Solves any valid Sudoku grid using CLP(FD) in Prolog
- 🎞️ Animated step-by-step visualization using Python
- 💡 Clear, educational, and visually engaging
- 🧠 AI-powered logic solving without brute-force

---

## 🧩 Project Structure

```
├── sudoku_animator.py   # Python animation and visualization script
├── solver.pl            # Prolog logic-based Sudoku solver (CLP(FD))
├── README.md            # You're here
```

---

## 🛠 Requirements

### Python

- Python 3.8+
- `matplotlib`
- `numpy`

Install with:

```bash
pip install matplotlib numpy
```

### Prolog

You’ll need **SWI-Prolog** to run the solver:

```bash
sudo apt install swi-prolog  # Ubuntu/Debian
brew install swi-prolog      # macOS
```

---

## 🚀 Usage

### Step 1: Solve with Prolog

Run the Prolog solver on your input:

```bash
swipl -s solver.pl
```

Follow the REPL instructions to enter or load a Sudoku grid and solve it.

### Step 2: Visualize with Python

Once the solution is generated, the `sudoku_animator.py` can animate it. Example usage:

```bash
python sudoku_animator.py
```

Make sure your Python script reads the solution from a file or is updated accordingly.

---

## 📸 Demo

Coming soon – a GIF or video of the solving process!

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you’d like to change.

---

## 📄 License

[MIT](LICENSE)

---

## 🙏 Acknowledgements

- Powered by [SWI-Prolog](https://www.swi-prolog.org/)
- Inspired by the beauty of logic and animation
