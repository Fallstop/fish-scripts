#!/usr/bin/env fish
function scale_pdf_pdf_pages --description 'Process and scale PDF pages'
    function clean_up
        echo "Cleaning up temporary files..."
        rm -rf "$temp_dir"
    end

    function show_help
        echo "Usage: scale_pdf_pdf_pages [-i input_pdf] [-o output_pdf] [-w target_width_mm]"
        echo "  -i, --input            Input PDF file"
        echo "  -o, --output           Output PDF file"
        echo "  -w, --width            Target width in mm"
    end

    # Initialize variables
    set -l input_pdf "input.pdf"
    set -l output_pdf "output.pdf"
    set -l target_width_mm ""
    set -l temp_dir (mktemp -d)
    mkdir -p "$temp_dir"
    echo "Intermediate files are saved in $temp_dir"


    # Parse command line arguments
    for arg in (seq (count $argv))
        switch $argv[$arg]
            case '-i' '--input'
                set input_pdf $argv[(math "$arg + 1")]
            case '-o' '--output'
                set output_pdf $argv[(math "$arg + 1")]
            case '-w' '--width'
                set target_width_mm $argv[(math "$arg + 1")]
            case '-h' '--help'
                show_help
                return 0
        end
    end

    # Ensure temporary directory cleanup on exit
    # trap clean_up EXIT

    # Check if the input PDF exists
    if not test -f "$input_pdf"
        echo "Input file $input_pdf not found!"
        return 1
    end

    echo "Splitting the PDF into individual pages..."
    echo $input_pdf
    echo $output_pdf
    echo $target_width_mm

    # Split the PDF into individual pages
    pdftk "$input_pdf" burst output "$temp_dir/page_%04d.pdf"

    # Get the target width from the first page if not provided
    if test -z "$target_width_mm"
        echo "Target width not provided, calculating from the first page..."
        set -l first_page "$temp_dir/page_0001.pdf"
        if not test -f "$first_page"
            echo "Error: First page not found after splitting the PDF!"
            return 1
        end

        # Extract the width of the first page
        set target_width_pts (pdfinfo $first_page | grep "Page size" | awk '{print $3}')
        set target_width_mm (echo "scale=2; $target_width_pts * 25.4 / 72" | bc)
    end

    echo "Target width (mm) based on provided value: $target_width_mm mm"

    # Process each page
    for page in "$temp_dir"/page_*.pdf
        echo "Processing page: $page"

        # Get the original dimensions of the page
        set -l page_info (pdfinfo "$page" | grep "Page size")
        set -l original_width_pts (echo "$page_info" | awk '{print $3}')
        set -l original_height_pts (echo "$page_info" | awk '{print $5}')

        echo "Original width (pts): $original_width_pts"
        echo "Original height (pts): $original_height_pts"
        echo "scale=6; $target_width_pts / $original_width_pts"
        # Calculate the new height maintaining the aspect ratio
        set -l scale_ratio (echo "scale=6; $target_width_pts / $original_width_pts" | bc)
        set -l new_height_pts (echo "scale=2; $original_height_pts * $scale_ratio" | bc)
        set -l new_height_mm (echo "scale=2; $new_height_pts * 25.4 / 72" | bc)

        echo "Scale ratio: $scale_ratio"
        echo "New height (pts): $new_height_pts"
        echo "New height (mm): $new_height_mm"

        # Scale the page
        set -l output_page (string replace -r '.pdf' '\-scaled.pdf' $page)
        echo "Creating scaled page: $output_page"
        pdfjam --outfile "$output_page" --papersize "{"$target_width_mm"mm,"$new_height_mm"mm}" --scale 1.0 "$page"

    end

    echo "Combining scaled pages into the final PDF..."
    # Combine the scaled pages into a single PDF
    # pdfjam "$temp_dir"/page_*-scaled.pdf --outfile "$output_pdf" --papersize "{"$target_width_mm"mm,"$new_height_mm"mm}" 
    pdfunite "$temp_dir"/page_*-scaled.pdf "$output_pdf"

    echo "All pages scaled to $target_width_mm mm width and combined into $output_pdf"
    clean_up
end

