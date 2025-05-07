# 📄 Docling PDF → Markdown Converter

Este projeto automatiza a conversão de arquivos `.pdf` em arquivos `.md` usando a biblioteca [Docling](https://github.com/docling-project/docling). Ideal para projetos de extração e preparação de texto com foco em aplicações de IA, NLP ou arquivamento estruturado.

---

## 🧱 Estrutura do Projeto

```plaintext
.
├── PDF/              # Coloque aqui seus arquivos .pdf
├── markdown/         # Arquivos .md gerados automaticamente
├── converter.py      # Script principal de conversão
├── setup.sh          # Script de configuração e instalação
├── requirements.txt  # Dependências do projeto
└── README.md
```

---

## ⚙️ Requisitos

- macOS ou Linux
- [Homebrew](https://brew.sh/) (para instalar pyenv)
- Python **3.10.13**
- [`pyenv`](https://github.com/pyenv/pyenv) e [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv)

---

## 🚀 Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo
````

### 2. Execute o script de configuração

Este script:

- Instala `pyenv` e `pyenv-virtualenv` (se necessário)
- Cria ambiente virtual com Python 3.10.13
- Instala as dependências do projeto
- Cria as pastas `PDF/` e `markdown/`

```bash
chmod +x setup.sh
./setup.sh
```

---

## ▶️ Como Usar

1. Coloque seus arquivos `.pdf` na pasta `PDF/`
2. Execute o conversor:

```bash
pyenv activate docling-env
python converter.py
```

1. Os arquivos `.md` convertidos aparecerão na pasta `markdown/`.

> O script ignora automaticamente arquivos que já foram convertidos.

---

## 🧪 Exemplo de uso do conversor

```python
from docling.document_converter import DocumentConverter

converter = DocumentConverter()
result = converter.convert("PDF/exemplo.pdf")
markdown = result.document.export_to_markdown()

with open("markdown/exemplo.md", "w", encoding="utf-8") as f:
    f.write(markdown)
```

---

## 🛑 Atenção

- O projeto **não versiona os arquivos da pasta `markdown/`** por padrão. Altere o `.gitignore` se quiser versioná-los.
- A conversão de arquivos com OCR (ex: PDFs escaneados) pode levar mais tempo.

---

## 📄 Licença

MIT
