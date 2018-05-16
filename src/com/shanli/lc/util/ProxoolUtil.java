package com.shanli.lc.util;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.logicalcobwebs.proxool.ProxoolException;
import org.logicalcobwebs.proxool.ProxoolFacade;
import org.logicalcobwebs.proxool.configuration.JAXPConfigurator;

/**
 * 连接池工具类
 * 
 * @author 李升华
 * 
 */
public class ProxoolUtil {
	private static String proxoolPrefix = "proxool.";
	private static boolean isLoadedDriver = false;

	private static void loadDriver() throws ClassNotFoundException {
		if (!isLoadedDriver) {
			Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
		}
	}

	/**
	 * 是否存在指定名称的连接池
	 * 
	 * @param alias
	 *            别名
	 * @return
	 */
	public static boolean has(String alias) {
		String[] aliases = ProxoolFacade.getAliases();
		if (aliases == null || aliases.length == 0) {
			return false;
		}
		for (String name : aliases) {
			if (name.equals( alias)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 使用配置文件创建连接池
	 * 
	 * @param file
	 * @throws ProxoolException
	 */
	public static void create(File file) throws Exception {
		loadDriver();
		JAXPConfigurator.configure(file.getAbsolutePath(), false);
	}

	/**
	 * 创建连接池
	 * 
	 * @param alias
	 *            别名
	 * @param driver
	 *            驱动类
	 * @param url
	 *            连接url
	 * @param username
	 *            账号
	 * @param password
	 *            密码
	 * @param string
	 * @throws Exception
	 */
	public static void create(String alias, String driver, String url, String username, String password)
			throws Exception {
		loadDriver();
		Properties props = new Properties();
		props.setProperty("proxool.house-keeping-test-sql", "select 0");
		props.setProperty("proxool.minimum-connection-count", "2");
		props.setProperty("proxool.trace", "true");
		props.setProperty("user", username);
		props.setProperty("password", password);
		
		url = proxoolPrefix + alias + ":" + driver + ":" + url;
		ProxoolFacade.registerConnectionPool(url, props);
	}
	
	/**
	 * 注销连接池
	 * @throws Exception 
	 */
	public static void remove(String alias) throws Exception{
		ProxoolFacade.removeConnectionPool(alias);		
	}

	/**
	 * 获取数据库连接
	 * 
	 * @param alias
	 *            连接池别名，无需"proxool."
	 * @return
	 * @throws SQLException
	 */
	public synchronized static Connection getConnection(String alias) throws SQLException {
		return DriverManager.getConnection(proxoolPrefix + alias);
	}

}
