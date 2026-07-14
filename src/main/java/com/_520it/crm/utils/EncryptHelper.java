// $Id: EncryptHelper.java 878 2017-03-04 09:29:42Z admin $
package com._520it.crm.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.*;

/**
 * Encryption utilities.
 */
public class EncryptHelper {

    public static String getCheckSum(Map<String, String> nvMap) {
        final String SEPARATOR = ":";
        String checksumString = "";

        TreeMap<String, String> treeMap = new TreeMap<String, String>(nvMap);
        Set<String> keys = treeMap.keySet();
        Collection<String> values = treeMap.values();

        Iterator<String> itKeys = keys.iterator();
        Iterator<String> itValues = values.iterator();
        StringBuffer sb = new StringBuffer();
        while (itKeys.hasNext()) {
            sb.append(itKeys.next()).append("=").append(itValues.next()).append(SEPARATOR);
        }

        if (sb.length() > 0) {
            checksumString = sb.substring(0, sb.length() - 1);
        }
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            return toHex(md.digest(checksumString.getBytes()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String toHex(byte[] ba) {
        char hexdigit[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        StringBuffer sb = new StringBuffer("");
        for (int i = 0; i < ba.length; i++) {
            sb.append(hexdigit[(ba[i] >> 4) & 0x0F]);
            sb.append(hexdigit[ba[i] & 0x0F]);
        }
        return sb.toString();
    }

    /** MD5 hash — retained for backward compatibility and non-password use cases. */
    public static String md5(String str) {
        if (str == null) return null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes(), 0, str.length());
            String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
            if (hashedPass.length() < 32) {
                hashedPass = "0" + hashedPass;
            }
            return hashedPass.toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static String md5(byte[] bytes) {
        if (bytes == null) return null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(bytes, 0, bytes.length);
            String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
            if (hashedPass.length() < 32) {
                hashedPass = "0" + hashedPass;
            }
            return hashedPass.toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    private static final String PW_CHARS = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    public static String getRandomPassword() {
        StringBuffer sb = new StringBuffer();
        Random r = new Random();
        for (int i = 0; i < 8; i++) {
            sb.append(PW_CHARS.charAt(r.nextInt(PW_CHARS.length())));
        }
        return sb.toString();
    }

    public static String md5_old(String data) {
        if (data == null) return null;
        StringBuffer buf = new StringBuffer(32);
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(data.getBytes("ISO-8859-1"));
            byte bytes[] = md5.digest();
            for (int i = 0; i < bytes.length; i++) {
                buf.append(Integer.toHexString((0x000000ff & bytes[i]) | 0xffffff00).substring(6));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return buf.toString();
    }

    // ───── SHA-256 + salt password hashing ─────

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();
    private static final String PREFIX_SHA256 = "$2$";
    private static final int SALT_LENGTH = 16;

    /**
     * Hash a password with SHA-256 and random salt.
     * @return "$2$base64salt$base64hash"
     */
    public static String hashPassword(String plainText) {
        byte[] salt = new byte[SALT_LENGTH];
        SECURE_RANDOM.nextBytes(salt);
        byte[] hash = sha256(salt, plainText);
        return PREFIX_SHA256 + base64Encode(salt) + "$" + base64Encode(hash);
    }

    /**
     * Verify a password against a stored hash. Supports SHA-256+salt (prefix "$2$")
     * and falls back to legacy MD5 comparison for backward compatibility.
     *
     * @return true if password matches
     */
    public static boolean verifyPassword(String plainText, String storedHash) {
        if (storedHash == null || plainText == null) return false;
        if (storedHash.startsWith(PREFIX_SHA256)) {
            // Format: $2$<base64_salt>$<base64_hash>
            String rest = storedHash.substring(PREFIX_SHA256.length());
            int sep = rest.indexOf('$');
            if (sep < 0) return false;
            byte[] salt = base64Decode(rest.substring(0, sep));
            byte[] hash = sha256(salt, plainText);
            return MessageDigest.isEqual(hash, base64Decode(rest.substring(sep + 1)));
        }
        // Legacy MD5 fallback
        return storedHash.equalsIgnoreCase(md5(plainText));
    }

    /**
     * Check if a stored hash uses the legacy MD5 format (not SHA-256+salt).
     */
    public static boolean isLegacyHash(String storedHash) {
        return storedHash != null && !storedHash.startsWith(PREFIX_SHA256);
    }

    private static byte[] sha256(byte[] salt, String plainText) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update(salt);
            digest.update(plainText.getBytes("UTF-8"));
            return digest.digest();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String base64Encode(byte[] bytes) {
        return Base64.getEncoder().encodeToString(bytes);
    }

    private static byte[] base64Decode(String s) {
        return Base64.getDecoder().decode(s);
    }

    public static void main(String[] args) {
        System.out.println(md5("admin"));
        System.out.println(md5("123"));
    }
}