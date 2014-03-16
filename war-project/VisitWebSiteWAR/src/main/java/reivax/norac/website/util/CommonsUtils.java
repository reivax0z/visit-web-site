package reivax.norac.website.util;

import java.io.IOException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;

public class CommonsUtils {

	public static FTPFile[] getFilesFromFTPServer(String directory){
		FTPClient f = new FTPClient();
		try {
			f.connect(Commons.FTP_SERVER);
			f.login(Commons.FTP_SERVER_USER, Commons.FTP_SERVER_PASS);
			FTPFile[] files = f.listFiles(directory);
			return files;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String getNameWithoutExtension(String name){
		try{
			String[] parts = name.split("\\.");
			return parts[0];
		} catch(Exception e){
			e.printStackTrace();
			return name;
		}
	}
}
