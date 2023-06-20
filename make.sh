#!/bin/bash

BUILDDIR="build"
AUTHOR_FILE="template/report.yaml"

if [ "$1" = "src" ] && [ -d "$1" ]; then
    INPUT_DIR="$1"

    # Check if the directory is empty
    if [ -z "$(ls -A "$INPUT_DIR")" ]; then
        echo "The directory $INPUT_DIR is empty."
        exit 1
    fi

    # Create a temporary Markdown file
    TEMP_FILE="$BUILDDIR/temp.md"

    # Combine all Markdown files in the directory into the temporary file
    cat "$AUTHOR_FILE" > "$TEMP_FILE"
    echo -e "\n\n" >> "$TEMP_FILE"
    for file in $INPUT_DIR/*.md; do
        cat $file >> $TEMP_FILE
        echo -e "\n\n" >> $TEMP_FILE
    done

fi

# Create the build directory if it doesn't exist
mkdir -p "$BUILDDIR"

# Check if Calibri font is installed
if fc-list : file | grep -i "arial.ttf" >/dev/null; then
    FONT_OPTION="--variable=mainfont:Arial"
else
    FONT_OPTION=""
fi

# Check if a file with the same name already exists in the build directory and delete it
if [ -f "$BUILDDIR/final-report.pdf" ]; then
    rm "$BUILDDIR/final-report.pdf"
fi


# Generate the PDF using Pandoc and the YAML metadata
pandoc "$TEMP_FILE" \
  $FONT_OPTION \
  --variable=mainfontoptions:"Scale=1" \
  --variable=fontsize:12pt \
  --variable=headingfontsize:14pt \
  --variable=subtitlefontsize:12pt \
  --variable=documentclass:report \
  --variable=geometry:"margin=1.2in" \
  --variable=mainfontoptions:"Scale=1" \
  --variable=justify:true \
  --toc \
  --output="$BUILDDIR/final-report.pdf" \
  --pdf-engine=xelatex



if [ $? -eq 0 ]; then
    echo "PDF generated: $BUILDDIR/final-report.pdf"
else
    echo "Error generating PDF."
fi

# Remove the temporary Markdown file
rm "$TEMP_FILE"
