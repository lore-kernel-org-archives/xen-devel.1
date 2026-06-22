Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC801CDB46F
	for <xen-devel@archiver.kernel.org>; Mon, 22 Jun 2026 17:21:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344021.1603205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbiKS-0003IO-Nw; Mon, 22 Jun 2026 17:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344021.1603205; Mon, 22 Jun 2026 17:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbiKS-0003IG-Kt; Mon, 22 Jun 2026 17:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1344021;
 Mon, 22 Jun 2026 17:20:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbiKR-0003IA-7M
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:20:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbiKQ-005GtO-8L
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 19:20:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a396ed3-bab6-0a2a0a5309dd-0a2a4502ca62-42
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:20:58 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a396efa-fdf1-0a2a45020019-d155802dc4f0-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 19:20:58 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490cdae130cso22758885e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 10:20:58 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492492338dasm224069875e9.1.2026.06.22.10.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 10:20:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1782148857; x=1782753657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh58htIrwA9B2iF9EAV5k6AIL6tsNh0NMoorfhc0EoY=;
        b=PKgOrNJ7D/PIMjkIY6UUOvifPchDzyXn04c1y2GkG53+JjQwfLU76b0vLgsNeZjWnm
         1VLVgto1R1aTry20ohaDY/iqLY+AYXWlnmGzIfTq1OVhC27llgpAjb7cZRz1osOK3cwq
         jNIoJGXOMg8Sp0Lkiybo9Tbgej5iUHZv2FRuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148857; x=1782753657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh58htIrwA9B2iF9EAV5k6AIL6tsNh0NMoorfhc0EoY=;
        b=E7NxRkjqx37VozhV9sz7ZAHN3p17qyo6N4EHlSHfrtBF8vRIUZdIjnEWy0j6gfxhoy
         Jih1rDaGqSXWC4cdjw1hewcH7P9QLkQ2H3sX3WmeflLQq4ofPPDi6uEszQRg11qgnz/O
         cksTtkTCvkWyDaUniJX1o6irC3yyvY60gz4zz1EVs+RIUh/5462zgQnag0l2sQJHeC5p
         QRapI/WvV+Xbf7HzylP8P3uAtKIkhhTm5++rh0ZdfDIw4q29sig1y/oMmaH6dFEZF6mX
         pyebYXiYt6baFyIrugVnkin5DI5l+XVS40RnX9NBbejNn0U5FtNq+nIzH5Uk9V6igHAO
         L47A==
X-Gm-Message-State: AOJu0Ywk0Y4i0gMocsKvnsYzGRlOtcUrgRKw3Y96VHPAt894TOYck450
	kpZ/x+9oNeELeiux+HnH+vFZ6CPAXed/Wh9ReF286snYk88bowRQABhLQWW6O6Wn1pmfcZqK7v2
	OkFK3FTU=
X-Gm-Gg: AfdE7ckeKK4N21TKjJkOWg3HL9Y2CcnZ8GmbouFMHBwTPS3ENhWYBr062iK2CWqS3kj
	/C5r6WXqVMV05JGP5wJmWYFJOY1ZpAgZKFUIi/JkTDMrST9OowtMWrjlRMKkxhn/+Q4YhQH6ddv
	Evpo6hnRF8xX0cTrhKqed0LqktI24Iet83UZ5rqM/RzeguHQQhsmpO4DeHBZdyOIHb5Q7DAhnYH
	/Hqa5/GETx9+CK/pAJ7gL4Ga4NtFzt/+kAtMuPuH0R4JNPrbBLkhP7C9FiIVyoEaayPWYzXwtRP
	1Hoq2wVOW2cojAdFJNHRycmsn5O72pZB7FMr9Y+Bj2srpXH+E3EeWCzfu2r0WR9UgiJXyJ+oYne
	4/fctydVEugwqTf27Tvl7Sp30WoNWT7yd9SepfFuqNyXDeYDtNPb9RrPL3bj+QxRmS+EH47xygT
	XPLzNSrr3bDcvkkJesLb63wrCLr8DfUJP/Tj3BTw9CFYZCtg5KyDwrVHnojSw9Ric=
X-Received: by 2002:a05:600d:8453:b0:492:37b7:6090 with SMTP id 5b1f17b1804b1-4923ef51a7fmr282110945e9.5.1782148857541;
        Mon, 22 Jun 2026 10:20:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Lin Liu <Lin.Liu01@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] x86/kexec: Check for a good per-cpu area before accessing IDTs
Date: Mon, 22 Jun 2026 18:20:54 +0100
Message-Id: <20260622172054.504778-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782148858-468603F3-FBAAE21E/10/73395122804
X-purgate-type: spam
X-purgate-size: 2928

Prior to commit 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)"),
the global idt_tables[] was always safe to use for CPUs in any state.

However, not-yet-onlined CPUs (e.g. MADT with more entries than exist in
practice) or offlined CPUs (e.g. xen-hptool) have their per-cpu pointer
poisoned to detect incorrect uses.  machine_kexec() trips over the posion when
clobbering #MC entry paths.

This fixes a fatal #GP (non-canonical memory reference) when trying to enter
the crash kernel.

Fixes: 9c20d3c5915d ("x86/IDT: Make idt_tables[] be per_cpu(idt)")
Reported-by: Lin Liu <Lin.Liu01@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Lin Liu <Lin.Liu01@citrix.com>

The fix here is a bit ugly.  nmi_shootdown_cpus() uses the cpu_online_map but
this is wrong too; it misses parked CPUs, which do want to be captured.

For 4.22.  This is the minimal fix to stop systems crashing, but more work is
needed to make this path fully robust.
---
 xen/arch/x86/machine_kexec.c | 8 +++++++-
 xen/common/percpu.c          | 1 -
 xen/include/xen/percpu.h     | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/machine_kexec.c b/xen/arch/x86/machine_kexec.c
index f921eec5aae6..0f5437cb65cc 100644
--- a/xen/arch/x86/machine_kexec.c
+++ b/xen/arch/x86/machine_kexec.c
@@ -18,6 +18,7 @@
 #include <xen/domain_page.h>
 #include <xen/elfstructs.h>
 #include <xen/kexec.h>
+#include <xen/percpu.h>
 #include <xen/types.h>
 
 #include <asm/fixmap.h>
@@ -171,7 +172,12 @@ void machine_kexec(struct kexec_image *image)
      */
     for ( i = 0; i < nr_cpu_ids; i++ )
     {
-        idt_entry_t *idt = per_cpu(idt, i);
+        idt_entry_t *idt;
+
+        if ( __per_cpu_offset[i] == INVALID_PERCPU_AREA )
+            continue;
+
+        idt = per_cpu(idt, i);
 
         if ( !idt )
             continue;
diff --git a/xen/common/percpu.c b/xen/common/percpu.c
index cdd70acbeaf3..f180f37253ed 100644
--- a/xen/common/percpu.c
+++ b/xen/common/percpu.c
@@ -13,7 +13,6 @@
 
 #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
 
-extern char __per_cpu_start[];
 extern const char __per_cpu_data_end[];
 
 unsigned long __read_mostly __per_cpu_offset[NR_CPUS];
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index fcf2095bd543..30609f49f0b3 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -43,6 +43,7 @@
 #endif
 
 extern unsigned long __per_cpu_offset[];
+extern char __per_cpu_start[];
 
 #define per_cpu(var, cpu)  \
     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))

base-commit: 6a21252a742ec021a814e124b88d273da37065db
-- 
2.39.5


