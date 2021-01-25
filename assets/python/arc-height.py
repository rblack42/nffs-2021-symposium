import sympy

r,x,y,px,py = \
  sympy.symbols('r x y px py')

eq1 = (x - px)**2 + (y - py)**2 - r**2
sol = sympy.solve([eq1],[y])

fh = sol[0][0]

print( sympy.simplify(sympy.expand(fh)))

eq2 = py - sympy.sqrt(r**2 -x**2 + 2 * px*x-px**2)

print(sympy.latex(eq2))

