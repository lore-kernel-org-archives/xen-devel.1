Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511CBCA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:55:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441393.1658978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2os-0000fq-Ls; Tue, 06 Oct 2026 10:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441393.1658978; Tue, 06 Oct 2026 10:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2os-0000fj-I9; Tue, 06 Oct 2026 10:54:50 +0000
Received: by outflank-mailman (input) for mailman id 1441393;
 Tue, 06 Oct 2026 10:54:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE2or-0000fd-MA
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:54:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2oq-00E64q-Vd
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:54:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ac4d371-bab6-0a2a0a5309dd-0a2a450699c8-30
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:54:48 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ac4d378-195a-0a2a45060019-d1558031b8cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:54:48 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so6193775e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 03:54:48 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c5df75sm55568145e9.15.2026.10.06.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 03:54:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1791284088; x=1791888888; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIkl9Uhf46HX5xVgAjNfSAx5apL+1t1WrMzeTv2NZDE=;
        b=JSRfHGqqgkH5VF73L2BtF/ZoG6A58uDjhfp5OIWSlwlJntfXId4aXklfMKSvwrxHwz
         JIZyJ73k9+HCroJh7ZNgQ7yw0YjXumGvvGG/dHgrlx3jeVW3JWk/HlQymtprrEAR5LsE
         mGsDTSNWo+T5U+WnAS0l8L+CX3UcgfAXWu2ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284088; x=1791888888;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIkl9Uhf46HX5xVgAjNfSAx5apL+1t1WrMzeTv2NZDE=;
        b=RF9F30tA+hs7wXCrhSvro7CHUEp1yJbJ+TmelgpD2QQ80uqdv7MJYdkbRXy3EVPoTE
         RoFBW4VAq0kP4RnCjpNUk+hZ6dEKxMROIrttt2uJA7UhllUKBLvlJb3wgXG7OqSOFQ4H
         +97ZKp++nTp29VA9PRHBFLbkexZDIFf0fkAweE84Q2tu/dFm/MTbGYCxxjZnMZfmT6mN
         F/cZelcTV8KtxHoJfTbJL+0fkQ4aFVsHLjJYCEFmvIJfgqhCjxKaoU4uNELJQeN+Z/rg
         HvWT6IxayqDp7B2MNDt6cCDfvt9ET1YNS1GsaGbKQN2EIjAvFPA82y25eyihxbXTZ7+/
         FlZA==
X-Gm-Message-State: AFuF++nnmvKHFB/2WD2a19NTixjMYAcCJiBewHmhCoCRtw8GqmfnD0Yy
	4cvWmbPXfyI/u2q37JJSk70VGLS7UIimW31rD1ZqDZ/53uP4WSAw6RUIKHq5e3ooO4mdq6kLQLL
	Xq4WYYBk=
X-Gm-Gg: AYBFou1xMbdC1aTKseYwOooZIGdKS8m+DIPMAFydIcdeZ7DrjywTefQMEcHSh+im3NE
	5G8fq54NNJObEGuwrPvczuz9ergcUUAp5qFjn4lrrGEmtCEuGZha5jsrIBKukXSRGt1zKJy55FB
	8UH321382edicaKUXy+Mo4j3EFaqb1SYpRby8QdX3+yNyZYplZTP+SVWrKXgsjvbQJzgcw2Be8k
	mueG83V1pLSZqz9x8nAEupz5W0u0Mc2OXGfIkE/Dkm64u76pZE1PPsRFNlaja9+m1aEqpza51EV
	TV+XDHQEVS37r4o0u5sa7fOW3mo/kIgcGPFhFy2TDysnZWdxWUOoWtDDzwjjIXWBLMZdXUO4BV3
	ylsM+lsfSQXJcyHCyNk1A455kz55sDEFPIrCcj4+gFd4aafxUTtI+sgQi9G8anTsiID+Ti2qMDY
	WhTKIlRoKMOHXFWqauLo61aMKjnOljI5LS6N/6ZdVSeMvV/qFgG4pHD3IGvC8i5oO9407BF9+xS
	OTNc1sBeY8zHhlTAbe7Umid+/ms0DbPg9tqMmlIwOPOwxfw
X-Received: by 2002:a05:600c:4fc2:b0:4a1:70da:3350 with SMTP id 5b1f17b1804b1-4a17b555cb7mr16939935e9.32.1791284088051;
        Tue, 06 Oct 2026 03:54:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/kexec: Annotate more noreturns
Date: Tue,  6 Oct 2026 11:54:45 +0100
Message-Id: <20261006105445.511099-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791284088-F5E0E77B-F26F6570/10/78276251493
X-purgate-type: spam
X-purgate-size: 3227

kexec_reloc() does not return.  Plumbing this property upwards lets us mark
machine_kexec() and machine_reboot_kexec() noreturn too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Rebase forward many years.
---
 xen/arch/x86/include/asm/machine_kexec.h | 7 ++++---
 xen/arch/x86/machine_kexec.c             | 5 ++---
 xen/common/kexec.c                       | 2 --
 xen/include/xen/kexec.h                  | 2 +-
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/machine_kexec.h b/xen/arch/x86/include/asm/machine_kexec.h
index 3e189acf2464..f0bdc2f44109 100644
--- a/xen/arch/x86/include/asm/machine_kexec.h
+++ b/xen/arch/x86/include/asm/machine_kexec.h
@@ -4,10 +4,11 @@
 #define KEXEC_RELOC_FLAG_COMPAT 0x1 /* 32-bit image */
 
 #ifndef __ASSEMBLER__
+#include <xen/compiler.h>
 
-extern void kexec_reloc(unsigned long reloc_code, unsigned long reloc_pt,
-                        unsigned long ind_maddr, unsigned long entry_maddr,
-                        unsigned long flags);
+extern void noreturn kexec_reloc(
+    unsigned long reloc_code, unsigned long reloc_pt, unsigned long ind_maddr,
+    unsigned long entry_maddr, unsigned long flags);
 
 extern const char kexec_reloc_end[];
 
diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index 038670922d47..0fb9ed50e780 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -142,15 +142,14 @@ void machine_kexec_unload(struct kexec_image *image)
     /* no-op. kimage_free() frees all control pages. */
 }
 
-void machine_reboot_kexec(struct kexec_image *image)
+void noreturn machine_reboot_kexec(struct kexec_image *image)
 {
     BUG_ON(smp_processor_id() != 0);
     smp_send_stop();
     machine_kexec(image);
-    BUG();
 }
 
-void machine_kexec(struct kexec_image *image)
+void noreturn machine_kexec(struct kexec_image *image)
 {
     int i;
     unsigned long reloc_flags = 0;
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 8ccaef1e0258..da3bb95d0852 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -397,8 +397,6 @@ void kexec_crash(enum crash_reason reason)
     kexec_crash_save_cpu();
     machine_crash_shutdown();
     machine_kexec(kexec_image[KEXEC_IMAGE_CRASH_BASE + pos]);
-
-    BUG();
 }
 
 static long noreturn cf_check kexec_reboot(void *_image)
diff --git a/xen/include/xen/kexec.h b/xen/include/xen/kexec.h
index e0d793b04316..6bb3fde629a6 100644
--- a/xen/include/xen/kexec.h
+++ b/xen/include/xen/kexec.h
@@ -49,7 +49,7 @@ int machine_kexec_load(struct kexec_image *image);
 void machine_kexec_unload(struct kexec_image *image);
 void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
 void noreturn machine_reboot_kexec(struct kexec_image *image);
-void machine_kexec(struct kexec_image *image);
+void noreturn machine_kexec(struct kexec_image *image);
 void kexec_crash(enum crash_reason reason);
 void kexec_crash_save_cpu(void);
 struct crash_xen_info *kexec_crash_save_info(void);
-- 
2.39.5


