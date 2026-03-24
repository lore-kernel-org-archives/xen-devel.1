Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3514EE9A77D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 12:33:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260634.1553904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wv-0005Mo-It; Tue, 24 Mar 2026 12:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260634.1553904; Tue, 24 Mar 2026 12:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50wv-0005Mf-Fj; Tue, 24 Mar 2026 12:33:33 +0000
Received: by outflank-mailman (input) for mailman id 1260634;
 Tue, 24 Mar 2026 12:33:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w50wu-0005LR-D0
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:33:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50wt-00EHMH-P9
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:33:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c28497-2eae-0a2a0a5409dd-0a2a4504dad8-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:31 +0100
Received: from [209.85.216.68] (helo=mail-pj1-f68.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c2849a-c823-0a2a45040019-d155d844b160-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:33:31 +0100
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-35a02f3b8feso2254278a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:33:31 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031ed04esm2215792a91.12.2026.03.24.05.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:33:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774355609; x=1774960409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQMNUr9KZ8pnRmWrzhYdmQttfHchPPrIJHh8762NZBU=;
        b=pbREfSWdlYODv1i2urbd4pFd0vV+I7J4eFwYOBLj3OMpAEeQta4Xq6Ah/zNq5yOjiX
         hJf6FncRKqBcvDWDAhzANXDT9rYh4txOAu+DZVLAy5W3nsOyZclSLgJ1lLL6vn9qjo+E
         ED3U03pR1ZXsleie9GA2T+yfQi6vz5W/9guogHMDhun8ep5rSUGQP4wf5yvqVY7hl0Df
         Wwn+3paVqUKUFz5CY/U+U0/AKuykXwFYWa6dyByKDg3gKIBLN05xGgCfNbNTBxT54uz7
         JWqcd2irUc3LqMRDQGsVQcWKkqTqR6RJBCJ7poG42Laeu+IsPueoDw9TSwOy2irQ7xTM
         K85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355609; x=1774960409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aQMNUr9KZ8pnRmWrzhYdmQttfHchPPrIJHh8762NZBU=;
        b=VRXiJVtRQYRcGfUBtbN9gJtu6vsaYUU89i2+3SoEXMM3JpXs71GPloHS7MMxeS/kKr
         H2fqlmCLgSBmsy1DlaS+ySu3m3pzrSlq/IgJGVsgicCc/QqvlWUCVF/8H2pL5OdTgFbJ
         lhSw29xzvaXxit7w22DpU/pgCcbRKB3PVAtZssHROsrSH+lfSmuRZgdO5/gHPquWm/yZ
         0ot1Z5KVUDeo24Hnk2+nOHKDMJTyCksvaYYRxxvf3UeW118tg2y02aKgSEX/3yw1D2dR
         eLnFzmJRvM1B6Yh8y6tagwQq80i97TLKSEOjXzAzcqtIJb9lawe/m00U393Af9sI3LTA
         EZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGNv4fHdYMEbcaxllkTlmGlHl+fvKAGAIDg83/UfhI9I/oq+iUyGiUq3cOd99NWuNATziStO0qESw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ3GWMYS/qMM2pRGPeKkNKRvgLycU/3U4L+SkDF15e/gm4Xt4b
	xJmjEjDomLn4/VwxDrxrDTdFpTi0zoJv4Jp6ub0eC8JUQsKiBftXO59B
X-Gm-Gg: ATEYQzw2eWl73plMt4wczpMobwWF49QQlrSgf2DShVsLhnmu3SS1sljrhk1XT6tHwkX
	Ud9QCt8fuzshBik4904dAY+A3xoIbo7p4jrPL4pLX6gA5TqpB34XuMZrXxEoy0NgJg5PogtHdVK
	P8QNvv0eP1J9Rif3g9sdvxv6WpCg3dVy2Y52FEJ59qajLKu3PEB2T8qFSd8ZfcKlvtAcsBTzklk
	t1Jp9SiSOP2Wj9KQWJri3EKMXxmSwPB0MyCP5L8gST1sDHDfFcj6WGf9BP2GzQ/0Nd+G6HMvGx6
	pAzaD4cG0WEf5nY/63XPhFBnhxVny7GHuWSOzh/RZr+LrYQUd+NVrE5xuHSPNAo5jGg6EsbEMv+
	g1/PyEPuqNjpWIdDzlBuGLt4hWIsUo/E+8oYuO2YiukLonex2vsGsePccauaaovjbsXnMPLdGiC
	lKtT41Deq/Pi6JsG/vFoie1KiKyYSoXmGw0BnLldZyxpTXw6eJxMZkwwA7OWk51pfbcyn7cG8xb
	EpW3o5eObqPdhBJTH9iB5hgvGT/AxFci1GCjzAEqKtXS+6veQN769p4LfnJubhTuhtDBgomkw==
X-Received: by 2002:a17:90b:3849:b0:35b:947d:9fca with SMTP id 98e67ed59e1d1-35bd2cb761emr12853966a91.19.1774355609215;
        Tue, 24 Mar 2026 05:33:29 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: sarkarsoumyajyoti23@gmail.com,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v5 2/3] x86/acpi: Integrate BGRT preservation with status reporting
Date: Tue, 24 Mar 2026 18:03:11 +0530
Message-ID: <20260324123312.11076-3-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774355611-B309B9D1-7F1FBAE9/0/0
X-purgate-type: clean
X-purgate-size: 3168

Add status reporting for BGRT preservation and integrate with Xen's
ACPI subsystem:
- efi_bgrt_status_info() prints preservation status (success/failure)
- Called from acpi_boot_init() after ACPI tables are processed
- Clarifying comment explains why invalidation code remains

The invalidation code in acpi_invalidate_bgrt() now acts as a safety
net: if preservation fails, the image remains in conventional RAM
and gets invalidated. If preservation succeeds, the image is in
EfiACPIReclaimMemory which won't match the RAM_TYPE_CONVENTIONAL
check, leaving the table valid.

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/acpi/boot.c |  8 ++++++++
 xen/common/efi/boot.c    | 16 ++++++++++++++++
 xen/include/xen/efi.h    |  1 +
 3 files changed, 25 insertions(+)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 1ca2360e00..20afe79db9 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/dmi.h>
+#include <xen/efi.h>
 #include <asm/fixmap.h>
 #include <asm/page.h>
 #include <asm/apic.h>
@@ -327,6 +328,11 @@ static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
 	return 0;
 }

+/*
+ * Invalidate BGRT if image is in conventional RAM (preservation failed).
+ * If preservation succeeded, image is in EfiACPIReclaimMemory, which
+ * won't match RAM_TYPE_CONVENTIONAL check, so table remains valid.
+ */
 static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
 {
 	struct acpi_table_bgrt *bgrt_tbl =
@@ -754,5 +760,7 @@ int __init acpi_boot_init(void)

 	acpi_table_parse(ACPI_SIG_BGRT, acpi_invalidate_bgrt);

+	efi_bgrt_status_info();
+
 	return 0;
 }
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 47d5b9b2a8..e22a42c15b 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1911,6 +1911,22 @@ static bool __init cf_check rt_range_valid(unsigned long smfn, unsigned long emf
     return true;
 }

+void __init efi_bgrt_status_info(void)
+{
+    if ( !efi_enabled(EFI_BOOT) )
+        return;
+
+    if ( bgrt_info.preserved )
+    {
+        printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
+               bgrt_info.size / 1024);
+        printk(XENLOG_INFO "EFI: BGRT relocated from %p to %p\n",
+               bgrt_info.old_addr, bgrt_info.new_addr);
+    }
+    else if ( bgrt_info.failure_reason[0] )
+        printk(XENLOG_WARNING "EFI: BGRT preservation failed: %s\n",
+               bgrt_info.failure_reason);
+}

 void __init efi_init_memory(void)
 {
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 2e36b01e20..cebda997a5 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -39,6 +39,7 @@ static inline bool efi_enabled(unsigned int feature)
 extern bool efi_secure_boot;

 void efi_init_memory(void);
+void efi_bgrt_status_info(void);
 bool efi_boot_mem_unused(unsigned long *start, unsigned long *end);
 bool efi_rs_using_pgtables(void);
 unsigned long efi_get_time(void);
--
2.53.0


