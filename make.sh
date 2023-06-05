#!/bin/bash

BUILDDIR="pdf"
AUTHOR_FILE="report.yaml"


# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input.md>"
    exit 1
fi

# Get the input file from the command-line argument
INPUT_FILE="$1"

# Create a temporary Markdown file
TEMP_FILE="$BUILDDIR/$(basename "$INPUT_FILE" .md)-temp.md"

# Copy the contents of the author.yaml file to the temporary file
cat "$AUTHOR_FILE" > "$TEMP_FILE"

# Add two new lines
echo -e "\n\n" >> "$TEMP_FILE"

# Append the contents of the input file to the temporary file
cat "$INPUT_FILE" >> "$TEMP_FILE"

# Extract the file name without extension
FILENAME=$(basename "$INPUT_FILE" .md)

# Create the build directory if it doesn't exist
mkdir -p "$BUILDDIR"

# Check if Calibri font is installed
if fc-list : file | grep -i "calibri.ttf" >/dev/null; then
    FONT_OPTION="--variable=mainfont:Calibri"
else
    FONT_OPTION="--variable=mainfont:sans-serif"
fi

# Check if a file with the same name already exists in the build directory and delete it
if [ -f "$BUILDDIR/$FILENAME.pdf" ]; then
    rm "$BUILDDIR/$FILENAME.pdf"
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
  --output="$BUILDDIR/$FILENAME.pdf" \
  --pdf-engine=xelatex

if [ $? -eq 0 ]; then
    echo "PDF generated: $BUILDDIR/$FILENAME.pdf"
else
    echo "Error generating PDF."
fi

# Remove the temporary Markdown file
rm "$TEMP_FILE"
