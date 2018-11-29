# ruby-queue

Este desafio consiste em desenvolver uma versão simplificada de uma "job queue" (fila de tarefas, em tradução livre).
A fila possui duas entidades: *jobs* (tarefas) e *agents* (agentes).

Um *job* é qualquer tarefa que precisa ser feita. Ele tem um id único, um tipo, que indica a categoria daquele job,
e uma flag booleana de urgência, que indica se o job tem prioridade alta.

Um *agent* é alguém que realiza tarefas. Ele também tem id único e dois conjuntos disjuntos de skills (habilidades) -
"primary" (primário) e "secondary" (secundário). Conjuntos de skills são listas de tipos de jobs que um agent tem permissão para realizar.

A operação chave da job queue é a função "dequeue" (desenfileirar) que, dado um pool de jobs a serem realizados
e um request de job por um agent, retorna o job com mais afinidade a ser realizado por aquele agente. A job queue
suporta, ainda, duas outras operações: "new_agent", que registra um novo agent, e "new_job", que registra um novo
job.

A função "dequeue" deve obedecer as seguintes regras:
- Jobs que chegaram primeiro devem ser realizados primeiro, a não ser que possuam a flag "urgent", caso no qual
  devem possui uma prioridade mais alta.
- Um job não pode ser designado a mais de um agente por vez.
- Um agent só recebe jobs cujos types pertencem a seu skillset.
- Um agent só recebe um job cujo type está no seu secondary skillset se nenhum job do seu primary skillset está
  na fila.

Em anexo encontram-se dois arquivos: sample-input.json e sample-output.json. Seu programa deve ser capaz
de, recebendo os conteúdos de sample-input.json por stdin, produzir os conteúdos de sample-output.json
em stdout.

A qualidade e legibilidade de seu código serão avaliadas.
