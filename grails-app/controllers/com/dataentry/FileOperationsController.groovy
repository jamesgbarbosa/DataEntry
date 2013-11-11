package com.dataentry

import java.util.zip.ZipOutputStream
import java.util.zip.ZipEntry

class FileOperationsController {

    def index() {
        redirect(action: 'rename')
    }

    def rename() {
        def name = "renamed_files"
        if(params.files != null) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream()
            ZipOutputStream zipFile = new ZipOutputStream(baos)

            request.getMultiFileMap().files.eachWithIndex { obj, i ->
                    def fileName = params."hnewFilename_${i+1}"
                    zipFile.putNextEntry(new ZipEntry(fileName))
                    zipFile << obj.getInputStream()
                    zipFile.closeEntry()
            }
            zipFile.finish()
            response.setHeader("Content-disposition", "filename=\"${name}.zip\"")
            response.contentType = "application/zip"
            response.outputStream << baos.toByteArray()
            response.outputStream.flush()
            return
        } else {
            []
        }
    }
}
