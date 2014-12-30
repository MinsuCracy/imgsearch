package org.imgsearch.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/admin/store/file/*")
public class FileUpController {

	private static final Logger logger = LoggerFactory.getLogger(FileUpController.class);
	 
	 private final static String UPLOAD_DIR = "/Users/kangminsu/tempdir/upload/";
	 
	 @RequestMapping(value="/down", produces={"application/octet-stream"})
	 public @ResponseBody byte[] downFile(@RequestParam(value="src", defaultValue="")String beforenpath, HttpServletResponse response)throws Exception{
	  
		String path = new String(beforenpath.getBytes("ISO-8859-1"),"utf-8"); 
		 
	  if(path.equals("")){
	   return null;
	  }
	 
	  response.addHeader("Content-Disposition","attachment; filename=1234567890"); 
	  
	  ByteArrayOutputStream bos = new ByteArrayOutputStream();
	  
	  byte[] buffer = new byte[1024*8];
	  
	  InputStream fin = new FileInputStream(UPLOAD_DIR+path);
	  
	  while(true){
	   int count = fin.read(buffer);
	   if(count == -1) { break; }
	   bos.write(buffer,0, count);
	  }
	  fin.close();
	  
	  return bos.toByteArray();
	 }
	 
	 
	 
	 @RequestMapping(value="/view/{path}", produces="image/jpeg")
	 public @ResponseBody byte[] viewFile(@PathVariable("path") String beforenpath)throws Exception{
	  
		 //String path = new String(beforenpath.getBytes("ISO-8859-1"),"utf-8");
		 
	  ByteArrayOutputStream bos = new ByteArrayOutputStream();
	  
	  byte[] buffer = new byte[1024*8];
	  
	  InputStream fin = new FileInputStream(UPLOAD_DIR+beforenpath+".jpg");
	  
	  while(true){
	   int count = fin.read(buffer);
	   if(count == -1) { break; }
	   bos.write(buffer,0, count);
	  }
	  fin.close();
	  
	  return bos.toByteArray();
	 }
	
	 private void createThumbnail(File origin)throws Exception{
	  
	  BufferedImage originalImage = ImageIO.read(origin);
	  BufferedImage thumbnailImage = 
	    new BufferedImage( originalImage.getWidth()/2,
	      originalImage.getHeight()/2,
	      BufferedImage.TYPE_INT_RGB);
	  
	  Graphics2D g = thumbnailImage.createGraphics();
	  g.drawImage(originalImage, 0, 0, 
			  thumbnailImage.getWidth(),thumbnailImage.getHeight(),null);
	  
	  File outputFile = new File(UPLOAD_DIR+"s_"+origin.getName() );
	  
	  ImageIO.write(thumbnailImage, "jpg", outputFile);
	 }
	 
	 
	 @RequestMapping(value = "/upload" , produces="text/html;charset=UTF-8")
	 @ResponseBody
	 public String uploadFile(MultipartFile file)throws Exception{
	  
	  if(file.isEmpty()){
	   return "NONE";
	  }
	  
	  byte[] buffer = new byte[1024*8];
	  
	  String fileName = UUID.randomUUID() +"_"+file.getOriginalFilename();
	  
	  String suffix = fileName.substring(fileName.lastIndexOf("."));
	  
	  logger.info("SUFFIX :" + suffix);
	  
	  InputStream in = file.getInputStream();
	  
	  File uploadedFile = new File(UPLOAD_DIR+fileName);
	  
	  
	  
	  OutputStream fos = new FileOutputStream(uploadedFile);
	  
	  while(true){
	   int count = in.read(buffer);
	   if(count == -1) { break;}
	   fos.write(buffer);
	  }
	  
	  fos.flush();
	  fos.close();
	  
	  
	 
	  
	  logger.info("-------------------");
	  
	  logger.info(fileName);
	  logger.info("-------------------");
	  
	  boolean isImage = isImage(fileName, suffix); 
	  if(isImage){
	   createThumbnail(uploadedFile);
	
  }
  
  String jsObjStr = "{fileName:'"+fileName+"',isImage:"+isImage+", suffix:'"+ suffix+"'}";

  String str = "<script>parent.updateResult("+jsObjStr+");</script>";
  
  
  return str;

  //return "<script> parent.showImage('"+fileName+"'); </script>";
 }

 private boolean isImage(String fileName, String suffix){
	if(suffix.contains(".jpg")){
		return true;
	}
	return false;
 }
}
