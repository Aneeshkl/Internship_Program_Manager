package com.util;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.io.IOException;

public class PdfGenerator {

    public static void main(String[] args) {
        // Specify the path where you want to save the PDF
        String filePath = "Downloads/report.pdf";

        // Generate sample content
        generatePdf(filePath);
    }

    public static void generatePdf(String filePath) {
        Document document = new Document(); // Create a Document instance

        try {
            PdfWriter.getInstance(document, new FileOutputStream(filePath));

            document.open(); // Open the document for writing

            // Add content to the document
            document.add(new Paragraph("Hello, this is a sample PDF generated with iText."));
            document.add(new Paragraph("You can add more content, formatting, and structure as needed."));

        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        } finally {
            if (document != null) {
                document.close(); // Close the document in a finally block
            }
        }
    }
}
