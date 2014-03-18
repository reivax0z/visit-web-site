package reivax.norac.website.util;

import java.io.IOException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

public class CommonsUtils {

	public static FTPFile[] getFilesFromFTPServer(String directory){
		FTPClient ftp = new FTPClient();
		try {
			ftp.connect(Commons.FTP_SERVER, 21);
			ftp.login(Commons.FTP_SERVER_USER, Commons.FTP_SERVER_PASS);
			int reply = ftp.getReplyCode();

			if(!FTPReply.isPositiveCompletion(reply)) {
				System.err.println("FTP server refused connection.");
				throw new Exception("Not able to connect");
			}
			
			String encodedDir = new String(directory.getBytes("UTF-8"), "ISO-8859-1");
			System.out.println("Requesting on: " + encodedDir);
			
			// get files
			FTPFile[] files = ftp.listFiles(encodedDir);

			ftp.logout();

			return files;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			if(ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch(IOException ioe) {
					// do nothing
				}
			}
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
