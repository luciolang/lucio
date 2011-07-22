# Lucio (en)

## What?
Lucio is **intended to be** a Lisp-like language developed in Ruby only for knowledge and fun. No profit intended.

## Why?
From Latin, Lucius means _Light_, because this development is enlightening my (poor) knowledge about programming languages, parsing and related subjects.

Lucio is also the name of one of the most important teachers I had, and I found this as a kind of homage.

The last, but not least, reason is to practice TDD, since I'm developing all the code using test-first.

## When?
Lucio is developed in my almost nonexistent spare time as a way to keep me learning and passionate with software development. 

## Who?
The list of colaborators is in the end of this file, in the Portuguese session.

## Small sample
    (/ (* (+ 1 2) (+ 3 4)) 2)
    => 10.5

    (eql? (* (+ 1 2) 3) 9)
    => true

    (if (eql? 10.5 (/ (* (+ 1 2) (+ 3 4)) 2))
      ("great"))
    => "great"

    (if (eql? 0 (/ (* (+ 1 2) (+ 3 4)) 2))
      ("great")
      ("ouch"))
    => "ouch"

# Lucio (pt\_BR)

## O que é?
Lucio **tem a intenção de ser** um dialeto Lisp desenvolvido inicialmente em Ruby apenas por diversão e aprendizado, sem qualquer intenção de lucro financeiro.

## Por que?
Em Latim, Lucius significa _Luz_, ou _Iluminação_, porque esse projeto está iluminando meu (pobre) conhecimento sobre linguagens de programação, interpretadores e assuntos relacionados.

Lucio é também o nome de um dos mais importantes professores que já tive, e encontrei nesse projeto uma forma de homenageá-lo.

O último motivo, mas não menos importante, é poder praticar TDD, partindo do princípio que estou desenvolvendo **todo** o código utilizando essa metodologia.

## Quando?
Lucio está sendo desenvolvido em meu quase inexistente tempo livre como uma forma de me manter sempre aprendendo coisas novas e motivado a continuar desenvolvendo.

## Quem?
Sou apenas um rapaz latino-americano sem dinheiro no bolso nem amigos importantes, mas que realmente adora o que faz e muito curioso. Se você quiser participar e colaborar, crie um fork e comece a codificar. Simples assim.

A lista de colaboradores está no final desse arquivo e, espero que continue crescendo.

## Exemplos simples
    (/ (* (+ 1 2) (+ 3 4)) 2)
    => 10.5

    (eql? (* (+ 1 2) 3) 9)
    => true

    (if (eql? 10.5 (/ (* (+ 1 2) (+ 3 4)) 2))
      ("great"))
    => "great"

    (if (eql? 0 (/ (* (+ 1 2) (+ 3 4)) 2))
      ("great")
      ("ouch"))
    => "ouch"

## Colaboradores:

* [P Balduino](/pbalduino)

* R Lorca - @lorchaos

* I Hercowitz - @ihercowitz

## Agradecimentos de pbalduino:

* Mestre Lúcio, pelo conhecimento e também pelo conhecimento que esse conhecimento trouxe;

* Minha esposa, pela paciência e apoio;

* Guy Steele, pelo Scheme, Common Lisp, Java e Javascript;

* Luciano Siqueira

* Bruno Jessen