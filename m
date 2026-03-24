Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ADBE9A77D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 12:29:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260573.1553850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sU-00019S-MK; Tue, 24 Mar 2026 12:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260573.1553850; Tue, 24 Mar 2026 12:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sU-00019L-Je; Tue, 24 Mar 2026 12:28:58 +0000
Received: by outflank-mailman (input) for mailman id 1260573;
 Tue, 24 Mar 2026 12:28:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w50sT-0000iz-9U
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:28:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50sS-00EGTP-L5
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:28:56 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c2837f-e002-0a2a0a5209dd-0a2a450a8b58-34
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:56 +0100
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c28388-1772-0a2a450a0019-d155da2cd587-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:56 +0100
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so639828966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:28:56 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.190])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm638180966b.6.2026.03.24.05.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:28:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355336; x=1774960136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjKcgpgVhPtaCMEXLSjgtM5Jeo9qa3Adh6wKPCR5tAQ=;
        b=OXVmHXT4K9YA2DAVQHDFyR9U/jUAXr94idFXgjajE+SATmuszGQKKj1rGBZDfARCYQ
         COLm9DcJXM9EFGnFOIs+W54KRAfuwTOsO47naFR9MmU1eNf3r7Xvu4aoAorep/umI0xY
         3HFe1Ziir4Z6YXcnjAnIiDRG8/Y+hfSkxgIZs4n7qSfMHXCi7WccLICmgqfcwq7diVGq
         mImWYAbnEBQsxrPNpDvocbxviHUwQOvfIMGqhESXW4benM1iCHYm0YGkHl8q1Jd5d1JV
         4MMy54z6JQPV4Vz4cuAfbdej0HJwpBT13aoOUPf00uW1AaSFE9nUcMVh5TjvywnGKMCq
         +Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355336; x=1774960136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SjKcgpgVhPtaCMEXLSjgtM5Jeo9qa3Adh6wKPCR5tAQ=;
        b=a/QRqXxl5TxY2jrydL9CnpIdvddjBWu0xWmpxao+1um9wql79cPa8yVxz71lHwhfdl
         nl+HqZ+uxbP/UnXUvph/C1wvqzM3iK9lhIeiLstNEMF/dOR9570oaonN0I90w5DJ9nhS
         agahnQ/RnjTG98v3BfahYbc4wPEqSDXNsL2s27lKyl6JTgKM7b4XY7Q8ZZCMoHZ54WtD
         ZeNbHns0v/todqwTTzywIfhcljJMIJvikLb8m4LMb/6n9N4/gE6rQRISChSlRDGbgSkC
         yVXfjO7VBXjWqW1luW/bhufuThNG3nQnul7bpRMg+Z9X55b63C+sCQ2xxcx8uhdnVwbk
         Fc6g==
X-Gm-Message-State: AOJu0Yyj6+ZNUSyA/0ZLc9AMvnPghFlPunbScxPfXHYN9z7qplaBP8l2
	hqgszEdgLacXppOFqnVSPq/Kssmry3rk5XVPAmdAh2zQYcxw2nTT5Pdnxj18XQ==
X-Gm-Gg: ATEYQzymdni2j4chJwAz1Va4K29mIteqa+oe6MicuNkUa0JlDe/iSzgB0n4NqZ1U139
	4hDs745ugjHThynAIqr+aaxkSHPTiNMPFXMW2G+SQ2xmRjeuq3dDJptziNsP/Y2Ha6Yh2Nve7Tw
	EWiLnCLFoTzbp7qCFs9weeLkSfgEFzttz9YHDdtWLvR8n/LG7ar1zleOsyQf2yPPatGdop7ygSw
	IVgmn19N4OwlKL9NVc4LyHc1Ms5IGk/TXH0WkpEBdTvoKNytjyvkFBZSXBtVFzTyPx++ap8j3D5
	PYt4vDj8ZjRLekTkLO2QU26hr7VYjbKLMeyodkw6w9qn7vc9shltsZuGqNAr7VOyX/em81hQCvV
	QV5zI27H2FRz+rwarsYWvawIIo8fgjtNc0EiQTp85wiodT2ZT54FLnwsGVnKNJVuDRTZgzVUzh0
	JXCLmnMJzOdPwOhEMgNYiGqslFLac=
X-Received: by 2002:a17:906:1b17:b0:b97:91c0:fc3b with SMTP id a640c23a62f3a-b982f242b11mr1012744866b.16.1774355335307;
        Tue, 24 Mar 2026 05:28:55 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v17 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Tue, 24 Mar 2026 14:26:35 +0200
Message-ID: <6a9b083bf18c9eb388076ba71041452937d29b01.1774353053.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774353053.git.mykola_kvach@epam.com>
References: <cover.1774353053.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774355336-52892900-8588D33B/0/0
X-purgate-type: clean
X-purgate-size: 4933

From: Mykola Kvach <mykola_kvach@epam.com>

The "xl resume" command was previously excluded from Arm builds because
system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
implemented. On x86, this command is used for resume.

This change enables compilation of `xl resume` on Arm regardless of the
underlying implementation status, making the tool available for testing
and future feature support. The relevant libxl infrastructure and handler
functions are already present and usable.

Note: This does not imply full system suspend/resume support on Arm.
      The `xl suspend` command still does not work on Arm platforms.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes in v16:
- no chnages
---
 tools/include/libxl.h     |  1 -
 tools/xl/xl.h             |  4 ++--
 tools/xl/xl_cmdtable.c    |  4 ++--
 tools/xl/xl_migrate.c     |  2 +-
 tools/xl/xl_saverestore.c |  2 +-
 tools/xl/xl_vmcontrol.c   | 12 ++++++------
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..14b9e4a859 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1145,7 +1145,6 @@ typedef struct libxl__ctx libxl_ctx;
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9000df00de..63db30a6eb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -65,7 +65,7 @@ static const char migrate_permission_to_go[]=
     "domain is yours, you are cleared to unpause";
 static const char migrate_report[]=
     "my copy unpause results are as follows";
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
   /* followed by one byte:
    *     0: everything went well, domain is running
@@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
 int main_suspend(int argc, char **argv);
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 int main_resume(int argc, char **argv);
-#endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..bcb2d233cc 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
       "Suspend a domain to RAM",
       "<Domain>",
     },
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "resume",
       &main_resume, 0, 1,
       "Resume a domain from RAM",
       "<Domain>",
     },
-#endif
     { "dump-core",
       &main_dump_core, 0, 1,
       "Core dump a domain",
@@ -548,7 +548,7 @@ const struct cmd_spec cmd_table[] = {
       "                        checkpoint must be disabled.\n"
       "-p                      Use COLO userspace proxy."
     },
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "devd",
       &main_devd, 0, 1,
       "Daemon that listens for devices and launches backends",
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..4b4a379aa1 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -767,7 +767,7 @@ int main_remus(int argc, char **argv)
     close(send_fd);
     return EXIT_FAILURE;
 }
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 /*
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..747094ec7b 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -270,7 +270,7 @@ int main_save(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-#endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c813732838..93766f631b 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -38,11 +38,6 @@ static void suspend_domain(uint32_t domid)
     libxl_domain_suspend_only(ctx, domid, NULL);
 }
 
-static void resume_domain(uint32_t domid)
-{
-    libxl_domain_resume(ctx, domid, 1, NULL);
-}
-
 int main_suspend(int argc, char **argv)
 {
     int opt;
@@ -55,6 +50,12 @@ int main_suspend(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
 
 int main_resume(int argc, char **argv)
 {
@@ -68,7 +69,6 @@ int main_resume(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
-#endif
 
 static void pause_domain(uint32_t domid)
 {
-- 
2.43.0


