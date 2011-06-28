# TODO

## Introdução

1. Toda a comunicação será feita através desse arquivo, das mensagens de commit e do código.

1. Dúvidas, intenções e próximos passos serão incluidos aqui.

1. Commits mal explicados ou sem uma mensagem clara e objetiva serão revertidos.

1. ???

1. Profit

## Tarefas

* Podemos fazer de duas formas: apagar as linhas de mensagens que foram resolvidas ou podemos simplesmente <strike>riscá-las</strike> e mantê-las por aqui, como uma forma rudimentar de histórico para quem não quiser/puder ver o versionamento do arquivo. O quê você prefere?

* Escrever testes para casos especiais ou que ainda levantem dúvidas sobre o funcionamento do parser.

* Finalizada uma versão funcional do parser, criar testes para resolver pequenas expressões matemáticas e fazer com que o Runner as execute.

* Minha primeira idéia foi de usar a classe Lexicon como uma espécie de dicionário de funções e operadores, onde ficariam as funções existentes e as novas. O Runner vai executar a expressão correspondente ao operador utilizando valores simples da lista. Caso seja encontrada uma lista dentro da lista atual, ela será passada recursivamente ao Runner até que retorne um valor simples.

* Exemplo:
<pre>
(eql? (+ 1 2) 3)
|
+--> runner: eql? (lista) 3                            +-> eql? 3 3 -> true
                  |                                    |
                  +-----> runner + 1 2 --> returns 3 --+
</pre>
