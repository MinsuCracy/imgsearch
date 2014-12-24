package org.imgsearch.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import org.imgsearch.web.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file/*")
public class AttachController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final static String UPLOAD_DIR = "C:\\zzz\\upload\\";
	
	@RequestMapping(value="/view", produces={"image/jpeg","image/gif","image/png"})
	public @ResponseBody byte[] viewFile(@ModelAttribute("path") String path) throws Exception {
		
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
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String uploadFile(MultipartFile file)throws Exception{
		
		if(file.isEmpty()){
			return "NONE";
		}
		
		byte[] buffer = new byte[1024*8];
		String fileName = file.getOriginalFilename(); //UUID.randomUUID() +"_"+file.getOriginalFilename();
		
		String suffix = fileName.substring(fileName.lastIndexOf("."));
		
		
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
		
		
		boolean isImage = isImage(suffix); 
		
		String jsObjStr = "{fileName:'"+fileName+"',isImage:"+isImage+", suffix:'"+ suffix+"'}";

		String str = "<script>parent.updateResult("+jsObjStr+");</script>";
		
		logger.info("str >>>> " + str);
		
		return str;
		
	}
	
	
	private boolean isImage(String suffix) {
		
		if(suffix.contains(".jpg") || suffix.contains(".gif") || suffix.contains(".png")){
			return true;
		}
		return false;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody void deleteFile(@ModelAttribute("path") String path) throws Exception {
		
		path = new String(path.getBytes("8859_1") , "UTF-8");
		
		String originalFile = UPLOAD_DIR + path;

		File file = new File(originalFile);
		file.delete();
		
		if(file != null){
			file.delete();
		}
		
	}

}
