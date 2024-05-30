package io.sourcya.playx_3d_scene.core.network

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import java.io.*
import java.nio.Buffer
import java.nio.ByteBuffer
import java.util.concurrent.TimeUnit


object NetworkClient {

    private val okHttpClient = OkHttpClient.Builder()
        .connectTimeout(10, TimeUnit.SECONDS)
        .readTimeout(5,TimeUnit.MINUTES)
        .writeTimeout(5,TimeUnit.MINUTES)
        .retryOnConnectionFailure(true)
        .build()

    private val client: NetworkService = Retrofit.Builder()
        .baseUrl(NetworkService.BASE_URL)
        .client(okHttpClient)
        .build()
        .create(NetworkService::class.java)


    suspend fun downloadFile(url: String): Buffer? {
        try {
        val responseBody = client.downloadFile(url).body() ?: return null

            val input: InputStream? = responseBody.byteStream()
            val stream = BufferedInputStream(input)
            ByteArrayOutputStream().use { output ->
                stream.copyTo(output)
                val byteArr = output.toByteArray()
                val byteBuffer = ByteBuffer.wrap(byteArr)
                return byteBuffer.rewind()
            }
        } catch (_: Throwable) {
            return null
        }
    }






    suspend fun downloadZip(url:String?) :  File? {
        // Large zip files should first be written to a file to prevent OOM.
        if(url.isNullOrEmpty()) return null

        return withContext(Dispatchers.IO) {
            try {
                val file = File.createTempFile("incoming", "zip" )
                val raf = RandomAccessFile(file, "rw")
                val responseBody = client.downloadFile(url).body() ?: return@withContext null
                val input: InputStream?
                try {
                    input = responseBody.byteStream()
                    val stream = BufferedInputStream(input)
                    ByteArrayOutputStream().use { output ->
                        stream.copyTo(output)
                        val byteArr = output.toByteArray()
                        val byteBuffer = ByteBuffer.wrap(byteArr)
                        raf.channel.write(byteBuffer)
                        raf.seek(0)
                         file
                    }
                } catch (_: Throwable) {
                     null
                }

            }catch (e:Throwable){
                e.printStackTrace()
                null
            }

        }





    }

}

