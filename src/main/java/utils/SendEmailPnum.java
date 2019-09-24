package utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

public class SendEmailPnum {
    //发件人
    private static String senderAddress="1850654096@qq.com";
    private static String sendAccount="二手物品置换平台";
    private static String sendPassWord="icayojsurcyxedig";
    private static Transport transport;
    private static String pnum;
    public static String sendEmail(String recipientAddress) throws MessagingException, IOException {
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth","true");
        properties.setProperty("mail.transport.protocol","smtp");
        properties.setProperty("mail.smtp.host","smtp.qq.com");
        Session session = Session.getInstance(properties);
        Message mimeMessage=getMessage(session,recipientAddress);
        transport = session.getTransport();
        transport.connect(senderAddress,sendPassWord);
        transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
        transport.close();
        return pnum;
    }

    private static MimeMessage getMessage(Session session,String recipentAddress) throws MessagingException {
        String[] pnumcoll = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
        Random random=new Random();
        pnum="";
        for(int i=0;i<6;i++){
            pnum+=(pnumcoll[random.nextInt(10)]);
        }
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(senderAddress));
        mimeMessage.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(recipentAddress));
        mimeMessage.setContent("验证码为："+pnum+"，有效期两分钟！","text/html;charset=UTF-8");
        mimeMessage.setSubject(sendAccount,"utf-8");
        mimeMessage.setSentDate(new Date());
        return mimeMessage;
    }
}
