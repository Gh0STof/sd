import tkinter as tk
import math

root = tk.Tk()
root.title("Калькулятор")

expression = ""
text_input = tk.Label(root, text="0", anchor="e", bg="white", width=15, font=("Arial", 20))
text_input.grid(row=0, column=0, columnspan=5, pady=10)

def update_display(val):
    global expression
    expression += str(val)
    text_input.config(text=expression)

def calculate(op):
    global expression
    expression += op
    text_input.config(text=expression)

def result():
    global expression
    if expression:
        expression = str(eval(expression))
        text_input.config(text=expression)

# Круглая расстановка кнопок (алгоритм - узор)
# Центр круга
cx, cy = 2, 3
radius = 2

# Кнопки 1-9 по кругу
for i in range(1, 10):
    angle = (i - 1) * (2 * math.pi / 9)
    x = round(cx + radius * math.cos(angle))
    y = round(cy + radius * math.sin(angle))
    tk.Button(root, text=str(i), width=3, command=lambda i=i: update_display(i)).grid(row=y, column=x, padx=2, pady=2)

# Кнопка 0 в центре
tk.Button(root, text="0", width=3, command=lambda: update_display(0)).grid(row=cy, column=cx, padx=2, pady=2)

# Операции в крайнем правом столбце
ops = [("*", lambda: calculate("*")), ("/", lambda: calculate("/")), ("+", lambda: calculate("+")), ("-", lambda: calculate("-")), ("=", result)]
for idx, (text_op, func_op) in enumerate(ops):
    tk.Button(root, text=text_op, width=3, command=func_op).grid(row=idx+1, column=5, padx=2, pady=2)

root.mainloop()
