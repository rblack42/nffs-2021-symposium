import sympy

r,c,t,theta = sympy.symbols('r c t theta')

eq1 = 2 * r * sympy.cos(theta) - c
eq2 = r -r * sympy.sin(theta) -t

sol = sympy.solve([eq1,eq2],[r,theta])
print(sympy.latex(sol))
