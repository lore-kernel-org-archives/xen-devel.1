Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7320606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlqGT9EY
Received: from list by lists.xenproject.org with outflank-mailman.1485659.1688820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQH-0005w6-6v; Thu, 12 Nov 2026 11:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485659.1688820; Thu, 12 Nov 2026 11:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTQH-0005uY-0s; Thu, 12 Nov 2026 11:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1485659;
 Thu, 12 Nov 2026 11:51:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <holyting07@gmail.com>) id 1xRTKq-0005aT-Qm
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:51:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTKq-00H85w-7Q
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:51:20 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a825-8faa-0a2a0a5109dd-0a2a4502a0e6-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:20 +0100
Received: from [209.85.215.176] (helo=mail-pg1-f176.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <holyting07@gmail.com>)
 id 6af5a836-6ca4-0a2a45020019-d155d7b0b98a-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:51:20 +0100
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-cc4aa0246b7so1721190a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:51:19 -0800 (PST)
Received: from Soun ([211.176.214.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b197c42a4csm4538630a91.4.2026.11.12.03.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 03:51:17 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484278; x=1795089078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVjATkhG9ZCGiH/NrYplUUMcfvyC1YgRbLZoC0yxMF4=;
        b=AlqGT9EYExh/4hneF1YWQMNGgvPlBCQVT5cEjFPzkEHcqqcrpH7wq1zjpSYlfk6wfO
         pD5qUva9xnEGFOjbXPHMghGVJuxTG16ZIMV8YuD2nuOg8QtwHEOSAr0geOX5yMcLdKVy
         yK8zrSwIVxjYNYvK6mvTcs3ZJ8W3W5PXgIUMGEUzcw41m0i2QRboyGgs0kx6B2Re/uPu
         T733YOQXNDX6qTYaBT/TAMa5E/E+VpXYkfoH0K0eFIKXVFrPIQ+Cr8FhIxPHLW8iSTgZ
         4InE0/S+6sDkJ3kwA33tTE/4X97wpTomEDFX8QmAQqVPkmabnQT/P/sJNc16bIi/b05y
         /upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484278; x=1795089078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVjATkhG9ZCGiH/NrYplUUMcfvyC1YgRbLZoC0yxMF4=;
        b=dMLEcZBGumwoxCWaSSMqgDbaC6yV8GpUH5BXFi7O5p1LZip/PwDQ++HHPBavF+JRkO
         6LAK1NO7nJ9Jk43kbIgEbF24KTTZTpfh2hNnF3lK9m2lDSktlwMvG2h7C3AQ54adqPjz
         NWvLhXbRgGFWxfKQi41tqnjW/H0guKXZ8MxIcclgd5IzQ7CJrYd6XiC6e13krBZOoxCQ
         0ToJmpnDED1AE0tgAccgbHHFyeXoMsICw3C8WhHJdUKqwtUat+/YLU9IcOHv83GvZlEe
         W7XMqwl4uZ1SR/Gacn1PMrA6oYqzBlY8EbgLAorgs5eyReaLEFnKYE4z6FBLKHB3O94B
         ioXA==
X-Gm-Message-State: APuU4Z9sRw+Su/MDU40zfz6pYIy4+3Dj4Ic58Xavh7Wf44BQ6yVEQ83t
	eBFF8RFAK7OJ45PldsAeEp2RtXEQPGjAHiBC9VU78XkBAW3NVMDX2YbM
X-Gm-Gg: AYBFou1AAujryYPQgHXROtU/fRHQ/RHIFye7CMx5OngnO5W3YB4GfF37lGPzbdqXEPz
	FTbcFK9U8UazDjX3et7vJttlFZhv1AdBexNN6okC1ibDPfItGBxbTzCYXzTcBjPkogeqV0K7WUh
	ysRp5deI1QOMxOLAjsN2roF+LZDrzHsP1dx8mV5hyL+Nidzqk4lfEmUyTy2JWHHEGfA6XUDyotF
	dsDgohZ/z6TZdfTmcU8vCAakgsJM635/Etgj23vrHFJeQdMDZ+AI2Iizt8QXvaEO9e7ZlfuuVlJ
	nAYb+ebDfV/RSXuV4lzfSz5yyNC+vfg/TljywIr6rauEWEiIpg+ZiTro2ibM2YHgb+7cvNWcCQ9
	9mdgNO7UqnVQpfFVlgiR9piV9eBFoHJKGbiOG30EblMDvOoUWzqZlcN5B+7IxS/dx/WNGN9GZFG
	cBFI2Oo4vUTiRNSNjaubu5hlE7YrL0PYahATF//maFtxbe4hwDRE9HPeROuhpVHuiqH+5UNiMbb
	Z9zgQ99wnx3oEBzfB5WvP6dhKKcEsG7nIOAn4b1JDO3FYCvbS7vYAg/GBTydsSujTH4LYOCIh02
	kFFZijJQ9Z7L5A4Vu0kZIEvn3TwCwAWJY0xhAab28Q2LNBQW9oSU8UaBYYdocQ9MDbKxJKyqnrh
	4nErx6hoCi+Ro3AwAg/wc5Dzo8bnb5P9UqGyJj3w=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr4637556a91.43.1794484278055;
        Thu, 12 Nov 2026 03:51:18 -0800 (PST)
From: SounLabs <holyting07@gmail.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	SounLabs <holyting07@gmail.com>
Subject: [PATCH 3/4] libfsimage/ufs: validate superblock divisors and directory record length
Date: Thu, 12 Nov 2026 20:49:48 +0900
Message-ID: <20261112114949.9936-4-holyting07@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261112114949.9936-1-holyting07@gmail.com>
References: <20261112114949.9936-1-holyting07@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794484280-F2AB52AC-E9DA121E/0/0
X-purgate-type: clean
X-purgate-size: 2077
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libfsimage is used by pygrub to parse the filesystem of an untrusted guest
disk image from dom0.  Three ufs on-disk fields are used without validation:

 - fs_inopb and fs_ipg are used as divisors by the itoo()/itog()/itod()
   macros in openi(); a zero value divides by zero (SIGFPE).
 - a directory entry's d_reclen advances the scan in dlook(); a zero value
   never advances and spins forever.

Reject a non-positive fs_inopb or fs_ipg at mount time, and stop the
directory scan on a zero d_reclen.

Same class of issue as XSA-497 (iso9660).  pygrub is only security supported
when run de-privileged (XSA-508), so this is hardening rather than a security
fix.

Signed-off-by: SounLabs <holyting07@gmail.com>
---
 tools/libfsimage/ufs/fsys_ufs.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/libfsimage/ufs/fsys_ufs.c b/tools/libfsimage/ufs/fsys_ufs.c
index a545bc9f65..12cc2f700d 100644
--- a/tools/libfsimage/ufs/fsys_ufs.c
+++ b/tools/libfsimage/ufs/fsys_ufs.c
@@ -49,7 +49,12 @@ ufs_mount(fsi_file_t *ffi, const char *options)
 	if (/*! IS_PC_SLICE_TYPE_SOLARIS(current_slice) || */
 	    !devread(ffi, UFS_SBLOCK, 0, UFS_SBSIZE, (char *)SUPERBLOCK) ||
 	    SUPERBLOCK->fs_magic != UFS_MAGIC ||
-	    MAXBSIZE < SUPERBLOCK->fs_bsize)
+	    MAXBSIZE < SUPERBLOCK->fs_bsize ||
+	    /* fs_inopb and fs_ipg are attacker-controlled and are used as
+	     * divisors by the itoo()/itog()/itod() macros in openi(); a
+	     * zero (or negative) value divides by zero (SIGFPE). */
+	    SUPERBLOCK->fs_inopb <= 0 ||
+	    SUPERBLOCK->fs_ipg <= 0)
 		return 0;
 
 	return 1;
@@ -257,6 +262,10 @@ dlook(fsi_file_t *ffi, grub_ino_t dir_ino, char *name)
 		dp = (struct direct *)(DIRENT + off);
 		if (dp->d_ino && substring(name, dp->d_name) == 0)
 			return (dp->d_ino);
+		/* d_reclen is attacker-controlled; a zero value would never
+		 * advance loc and would spin forever. */
+		if (dp->d_reclen == 0)
+			return (0);
 		loc += dp->d_reclen;
 	}
 	return (0);
-- 
2.52.0.windows.1


