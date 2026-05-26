---
description: Workflow exclusivo para projetos mobile. Serve para a criação, especificação interativa e setup de uma nova feature utilizando Spec-Driven Development (SDD) e entrevista ativa de requisitos.
---

# Workflow: Setup Interativo de Novas Features (SDD) - Mobile

> [!IMPORTANT]
> **ATENÇÃO:** Este workflow serve **unicamente** para o setup de features em **projetos mobile**.

Este workflow orienta o agente de IA no processo de intake interativo para a especificação e criação de uma nova feature no projeto mobile, garantindo total conformidade com o padrão definido no arquivo [SPEC-MOBILE.md](../specs/SPEC-MOBILE.md).

O agente deve guiar o usuário em uma entrevista estruturada em etapas consecutivas e ordenadas, coletando as informações necessárias para preencher e persistir a especificação técnica da feature.

---

## 📋 Regras de Execução do Workflow

### 1. Etapa de Identificação Inicial
O agente deve iniciar a conversa saudando o usuário e coletando os dados básicos de identificação da feature:
* **Nome da Feature** (ex: `Autenticação com Google`)
* **ID da Feature** (ex: `FEATURE-0001` ou incrementado baseado nas specs existentes em `.antigravity/specs/`)
* **Objetivo Principal** (O que a feature realiza de valor para o negócio/usuário)

### 2. Entrevista Estruturada (Obrigatório seguir esta ordem)

O agente deve perguntar os seguintes itens de forma consecutiva, aguardando a resposta do usuário a cada etapa antes de avançar para a próxima:

#### **Passo A: Requisitos Funcionais (RF)**
* **Pergunta ao usuário:** Solicitar quais são os Requisitos Funcionais da funcionalidade (o que o sistema deve fazer).
* **Formatação interna:** O agente deve classificar e organizar essas respostas como `RF-001`, `RF-002`, `RF-003`, etc.
* **Exemplo de auxílio:** O agente pode dar sugestões de RFs comuns caso o usuário precise de ideias (ex: carregamento de dados, clique de botão, feedback visual).

#### **Passo B: Regras de Negócio (RN)**
* **Pergunta ao usuário:** Apenas após alinhar os RFs, solicitar quais as Regras de Negócio e validações lógicas associadas a esses requisitos (restrições, formatações, fluxos alternativos, permissões).
* **Formatação interna:** Organizar como `RN-001`, `RN-002`, etc.
* **Exemplo de auxílio:** Sugerir regras comuns como limites de caracteres, restrição de acesso por login, comportamentos offline.

#### **Passo C: Critérios de Aceite (CA)**
* **Pergunta ao usuário:** Por fim, solicitar quais são os Critérios de Aceite para que a feature possa ser homologada com sucesso (como verificar que a feature funciona de forma observável).
* **Formatação interna:** Organizar como `CA-001`, `CA-002`, etc.
* **Exemplo de auxílio:** Sugerir critérios objetivos de teste (ex: "Exibir mensagem de erro Y quando a chamada de API Z falhar").

---

## 🛠️ Persistência e Criação do Arquivo de Spec

Uma vez coletados os **Requisitos Funcionais**, as **Regras de Negócio** e os **Critérios de Aceite**, o agente deve realizar o seguinte procedimento automatizado:

1. **Carregar o Template:** Ler o conteúdo de [SPEC-MOBILE.md](../specs/SPEC-MOBILE.md).
2. **Mesclar os Dados:** Substituir os placeholders correspondentes na Spec com as respostas acordadas:
   * **Seção 1 (Identificação):** Preencher com nome da feature, data atual, branch sugerida, etc.
   * **Seção 2 (Objetivo):** Preencher com o objetivo principal coletado.
   * **Seção 6 (Requisitos funcionais e Regras de negócio):** Inserir as tabelas populadas com as IDs `RF-*` e `RN-*`.
   * **Seção 17 (Critérios de aceite):** Inserir a tabela populada com as IDs `CA-*`.
   * **Seção 16 (Estratégia de testes):** Mapear testes unitários básicos e de widget (`TU-*` e `TW-*`) correlacionados com os requisitos levantados.
3. **Persistir a Spec:** Criar o arquivo no diretório `.antigravity/specs/` com o nome estruturado:
   * **Caminho:** `.antigravity/specs/FEATURE-<ID>-<nome-da-feature>.md` (ex: `c:\Users\thiag\Projetos\Gemini_CLI_Projects\SDD_Gemini\.antigravity\specs\FEATURE-0001-login-social.md`).
4. **Apresentar e Solicitar Aprovação Final (DoR):**
   * Mostrar o link do arquivo gerado para o usuário.
   * Exibir uma tabela resumo contendo as chaves coletadas (`RF`, `RN`, `CA`).
   * Perguntar explicitamente: *"Esta especificação atende às suas expectativas? Posso avançar para a Fase 5 (Plano de Implementação)?"*

---

## 🚦 Próximos Passos (Aprovado pelo Usuário)
Assim que o usuário der a aprovação, o agente deve:
1. Atualizar o status da spec para `Aprovada`.
2. Seguir a Fase 5 do `project-guide-rules.md`, gerando o plano de tarefas técnicas detalhadas de arquivos a serem criados/alterados e submetendo-o para revisão.
