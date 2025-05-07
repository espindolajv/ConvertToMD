#!/bin/bash

echo "🚀 Iniciando configuração completa do projeto Docling..."

# Verifica se pyenv está instalado
if ! command -v pyenv &> /dev/null; then
  echo "📦 Instalando pyenv..."
  brew update
  brew install pyenv
fi

# Verifica se pyenv-virtualenv está instalado
if ! brew list pyenv-virtualenv &>/dev/null; then
  echo "📦 Instalando pyenv-virtualenv..."
  brew install pyenv-virtualenv
fi

# Adiciona pyenv ao shell atual (zshrc será ignorado se não estiver rodando interativamente)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Instala Python 3.10.13 se necessário
if ! pyenv versions | grep -q "3.10.13"; then
  echo "🐍 Instalando Python 3.10.13 via pyenv..."
  pyenv install 3.10.13
fi

# Cria e ativa o ambiente virtual
if ! pyenv virtualenvs | grep -q "docling-env"; then
  echo "🔧 Criando ambiente virtual docling-env..."
  pyenv virtualenv 3.10.13 docling-env
fi

echo "✅ Ativando ambiente virtual docling-env..."
pyenv activate docling-env

# Cria pastas necessárias
echo "📁 Criando pastas PDF/ e markdown/..."
mkdir -p PDF markdown

# Gera requirements.txt se não existir
if [ ! -f "requirements.txt" ]; then
  echo "📝 Gerando requirements.txt padrão..."
  cat <<EOF > requirements.txt
docling==2.30.0
torch==2.2.2
EOF
fi

# Instala as dependências
echo "📦 Instalando dependências..."
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "🎉 Projeto pronto para uso!"
echo ""
echo "📂 Coloque seus PDFs em:      ./PDF/"
echo "📄 Arquivos .md gerados em:   ./markdown/"
echo ""
echo "⚙️ Para converter, execute:"
echo ""
echo "    pyenv activate docling-env"
echo "    python converter.py"
echo ""
echo "💡 Lembre-se de adicionar .venv/, markdown/ e __pycache__/ ao seu .gitignore se ainda não fez isso."
