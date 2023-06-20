# PandocReportGen

This project is a script for generating a PDF report from a Markdown file using Pandoc. It combines the contents of an input Markdown file and an author metadata file to create a formatted report in PDF format.

## Prerequisites

Before running the script, make sure you have the following dependencies installed:

- [Pandoc](https://pandoc.org/): A universal document converter
- [XeLaTeX](https://www.latex-project.org/get/) (TeX Live or MiKTeX): A typesetting system for creating PDF documents
- The necessary fonts for the document class you are using (e.g. [Arial](https://ctan.org/pkg/arial) for the `article` class)

## Usage

To use this script, follow the steps below:

1. Clone the repository or download the script to your local machine.
2. Open a terminal and navigate to the project directory.
3. Make the script executable (if necessary) using the command: `chmod +x make.sh`
4. If you have any images to include in the report, place them in the `images` folder within the project directory.
5. Run the script with the following command: `./make.sh src`

In the `src` folder add all your Markdown files. The script will generate a PDF report based on the provided Markdown files and the author metadata file (`template/report.yaml`). If you have any images referenced in your Markdown file, ensure that they are placed in the `images` folder. The generated PDF will be saved in the `build` directory.

Please ensure that you update the Markdown file to reference the images correctly, using relative paths from the `images` folder. For example, if you have an image named `image.png` in the `images` folder, you can reference it in the Markdown file as `![Image](images/image.png)`.

## Configuration

You can modify certain variables in the script to customize the PDF output. The variables can be found at the beginning of the script:

- `BUILDDIR`: The directory where the generated PDF will be saved. You can change this to a different directory if desired.
- `AUTHOR_FILE`: The path to the author metadata file (`report.yaml`). If your file has a different name or location, update this variable accordingly.

You can also adjust the Pandoc options in the script to change the PDF output settings, such as font size, page margins, document class, and more. Refer to the [Pandoc documentation](https://pandoc.org/MANUAL.html) for more information on available options.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- The script is inspired by the need to automate the generation of PDF reports from Markdown files.
- Special thanks to Pandoc for providing a versatile document conversion tool.

