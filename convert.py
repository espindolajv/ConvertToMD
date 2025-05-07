import os
from pathlib import Path
from docling.document_converter import DocumentConverter

def converter_para_markdown(caminho_arquivo_pdf: Path, caminho_saida_md: Path):
    converter = DocumentConverter()
    resultado = converter.convert(str(caminho_arquivo_pdf))
    markdown = resultado.document.export_to_markdown()

    with open(caminho_saida_md, "w", encoding="utf-8") as f:
        f.write(markdown)

    print(f"✅ Convertido: {caminho_arquivo_pdf.name} → {caminho_saida_md.name}")

def main():
    pasta_pdf = Path("PDF")
    pasta_md = Path("markdown")
    pasta_md.mkdir(exist_ok=True)

    arquivos_pdf = sorted(pasta_pdf.glob("*.pdf"))

    for arquivo_pdf in arquivos_pdf:
        nome_base = arquivo_pdf.stem
        caminho_saida = pasta_md / f"{nome_base}.md"

        if caminho_saida.exists():
            print(f"⏩ Já convertido: {caminho_saida.name}")
            continue

        try:
            converter_para_markdown(arquivo_pdf, caminho_saida)
        except Exception as e:
            print(f"❌ Erro ao converter {arquivo_pdf.name}: {e}")

if __name__ == "__main__":
    main()
