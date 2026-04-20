#!/bin/bash

# Database: Symbol + Description
SYMBOLS=$(cat <<EOF
# --- GREEK UPPERCASE ---
Α Alpha (upper)
Β Beta (upper)
Γ Gamma (upper)
Δ Delta (upper)
Ε Epsilon (upper)
Ζ Zeta (upper)
Η Eta (upper)
Θ Theta (upper)
Ι Iota (upper)
Κ Kappa (upper)
Λ Lambda (upper)
Μ Mu (upper)
Ν Nu (upper)
Ξ Xi (upper)
Ο Omicron (upper)
Π Pi (upper)
Ρ Rho (upper)
Σ Sigma (upper)
Τ Tau (upper)
Υ Upsilon (upper)
Φ Phi (upper)
Χ Chi (upper)
Ψ Psi (upper)
Ω Omega (upper)

# --- GREEK LOWERCASE ---
α alpha
β beta
γ gamma
δ delta
ε epsilon
ζ zeta
η eta
θ theta
ι iota
κ kappa
λ lambda
μ mu
ν nu
ξ xi
ο omicron
π pi
ρ rho
σ sigma
τ tau
υ upsilon
φ phi
χ chi
ψ psi
ω omega

# --- MATHEMATICAL OPERATORS ---
∑ Sum (Somatório)
∫ Integral
∬ Double Integral
∀ For All (Para todo)
∃ Exists (Existe)
∄ Does Not Exist (Não existe)
∈ Element Of (Pertence)
∉ Not Element Of (Não pertence)
⊂ Subset (Subconjunto)
⊆ Subset or Equal
∪ Union (União)
∩ Intersection (Interseção)
∧ Logical AND (Conjunção)
∨ Logical OR (Disjunção)
¬ Logical NOT (Negação)
⇒ Implies (Implica)
⇔ Equivalent (Equivale)
≡ Identical To
≠ Not Equal To
≈ Almost Equal To
≤ Less-Than or Equal
≥ Greater-Than or Equal
∞ Infinity
∇ Nabla (Gradient)
∅ Empty Set (Conjunto Vazio)
∴ Therefore
∵ Because
√ Square Root
EOF
)

# Filter out comments and empty lines, then run rofi
chosen=$(echo "$SYMBOLS" | grep -v '^#' | grep -v '^$' | rofi -dmenu -i -p "Math/Greek:" | awk '{print $1}')

if [ -n "$chosen" ]; then
    wtype "$chosen"
fi