Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EA1606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=rGWIi7UX
Received: from list by lists.xenproject.org with outflank-mailman.1492246.1692967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnD-0006vW-QM; Tue, 17 Nov 2026 11:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492246.1692967; Tue, 17 Nov 2026 11:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnD-0006um-Kc; Tue, 17 Nov 2026 11:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1492246;
 Tue, 17 Nov 2026 11:56:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTHnB-0006gZ-VV
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:56:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHnB-00EnVn-Bs
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:56:05 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40d5-bab6-0a2a0a5309dd-0a2a450cc6f8-0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:05 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40d5-f479-0a2a450c0019-d155dd2de4aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:05 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4a34ffd3e39so498512f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:56:05 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a43d41ec2dsm3659291f8f.14.2026.11.17.03.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 03:56:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794916565; x=1795521365; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt0OUj2t7/jevD/9Nji9Fgxx+gVnBvLNh4fihmxNq5g=;
        b=rGWIi7UXgog4YrxSpSVhss/+xqj4Ajmp3jDCTg6XEMKaeip0+NvLDgqweZ4H5qF8/5
         jib92VZSpDMoHhSLSAV+eb84GKSfSJKUm4xHsTkhk0xhVqfzPfV/V5CPQFHwNSk2fEiH
         YqGSbJDFi/h/wR/M/B7dLjO0P86Dkqb9WrAK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916565; x=1795521365;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt0OUj2t7/jevD/9Nji9Fgxx+gVnBvLNh4fihmxNq5g=;
        b=fgYpmr/sNfXewAybgPd0HQG71NQciMi1gl457Ts1DksU3auczi23YC8rVpRvGh26cd
         rZKuFWj2TsgcSqqR+NHAVyUCVqEJKyuFnKQT3HXWPl5k8S0bg3OXjJyvtYhln6/WFGM8
         UsZopQsdufvt8A5HYQIuGqFFoeX2jCf6LgsrKF1XIti4zKow3uXCJiUBDaK/lPSLYkd2
         2KlhuMB9oayN6mxfu3TkmoYxzBL2Vr617WVCsxjGO7wEenZUuThe3WZJBrn7nznLMW4W
         t8yiHBJ7zmh2IeNdQ01pkBThx/+dNSW6Vr8TdON7iqmJuIzBy6hWGUMz/Wpy0LCfqXkm
         +t3Q==
X-Gm-Message-State: APuU4Z9aRFvceUxD1rt5efzc/V7iDaq/wG8hMMBtyfyl2j0FtHsiYGTt
	FcwDEXIV6tQIKOWko9ebfl/5iajNlQjqU7BD6nucbUN1i0w/YKf6a3g9HHlgyUssdeMsiLVhHIp
	DHqo6xY4=
X-Gm-Gg: AZFdTZeT8egThShVSuA0m3JKS+BqCzkGQkHAWTp4vWSx2/whQP41NXfcYl4ePA4QMc7
	+CLt8yjnXoIJrTpTcn9IVt/dblew10XEJ51BY/Hip0V1cTBpCa1ndELLkWPHupWEKa7zkLATWz/
	gEKqkPCV4iUU0oYFVOQpK7NFS57UHu2n93Eg1H+Rj8aooYICap0ZXFnRyIknSXXpb+t26jSPdTl
	9KIjWNw9iEXyOOSLsHFGPuNwrQTlNvfN0/bNRWMIc5bvQd+rh2hkSFXpsFDC41eAjjzgeotiM75
	zbemztEfKU1VB36rTEik41NE0LG1OuKn2Hf3kI16TXj5hd/8OD3/zhHyATbeR6zbcsFVfxPqYiK
	5k6/KOBmr4RV30JVEmHMOlJstegwmof7INYAfQVHSPS05JCSVk4Q0CXudphFZo55x56h/Aeepo7
	Fu6yTN/lXxXeIyUTZ3HmTA0G17GJBQgEvGaizr5pwKgTfYAk054RjXGpuH7/QM08dzbFqv1onqN
	dFdbaWKuU5pT9TTZKUAeIp2fbNCN6fNSWF19QyKIgxe6XYP4x5jssYl8wH5QTiuaUCeskfZ3log
	bOVar0S8/B/nLW6k2m8Ie2rp1mNhpTatuL8be+sPCuwNli5yDUF3mzJttGaMvffDM6t1VQhIsre
	EFYg=
X-Received: by 2002:a05:6000:65b:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-49c740bc18cmr24274172f8f.39.1794916564508;
        Tue, 17 Nov 2026 03:56:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 2/3] xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
Date: Tue, 17 Nov 2026 11:55:48 +0000
Message-Id: <20261117115549.3872611-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794916565-01CC3A5B-6C9356D4/10/78276251493
X-purgate-type: spam
X-purgate-size: 9275
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We have two ways of spelling debug build in Xen, one with positive form and
one with an inverted form.

Convert the remaining uses of NDEBUG to CONFIG_DEBUG.  In some cases,
rearrange the #if/#else to keep using CONFIG_DEBUG in a positive form.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/arm/mmu/pt.c                  | 10 +++++-----
 xen/arch/x86/domain_page.c             |  6 +++---
 xen/arch/x86/hvm/svm/emulate.c         |  2 +-
 xen/arch/x86/include/asm/page.h        |  3 ++-
 xen/arch/x86/include/asm/setup.h       |  6 +++---
 xen/arch/x86/mm/shadow/private.h       |  8 ++++----
 xen/arch/x86/traps.c                   |  6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
 xen/drivers/char/console.c             | 12 ++++++------
 xen/include/xen/lib.h                  | 18 +++++++++---------
 10 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 81fe121517b1..e3aee6d0c8d4 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -14,17 +14,17 @@
 #include <asm/current.h>
 #include <asm/fixmap.h>
 
-#ifdef NDEBUG
-static inline void
-__attribute__ ((__format__ (__printf__, 1, 2)))
-mm_printk(const char *fmt, ...) {}
-#else
+#ifdef CONFIG_DEBUG
 #define mm_printk(fmt, args...)             \
     do                                      \
     {                                       \
         dprintk(XENLOG_ERR, fmt, ## args);  \
         WARN();                             \
     } while (0)
+#else
+static inline void
+__attribute__ ((__format__ (__printf__, 1, 2)))
+mm_printk(const char *fmt, ...) {}
 #endif
 
 #ifdef CONFIG_ARM_64
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f02be1675b5d..5bc3c29aad82 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -68,7 +68,7 @@ void *map_domain_page(mfn_t mfn)
     struct mapcache_vcpu *vcache;
     struct vcpu_maphash_entry *hashent;
 
-#ifdef NDEBUG
+#ifndef CONFIG_DEBUG
     if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
@@ -230,7 +230,7 @@ void mapcache_domain_init(struct domain *d)
 
     ASSERT(is_pv_domain(d));
 
-#ifdef NDEBUG
+#ifndef CONFIG_DEBUG
     if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return;
 #endif
@@ -297,7 +297,7 @@ void *map_domain_page_global(mfn_t mfn)
              system_state < SYS_STATE_active) ||
             local_irq_is_enabled()));
 
-#ifdef NDEBUG
+#ifndef CONFIG_DEBUG
     if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 1f786a44cc79..1f13013588cf 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -63,7 +63,7 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
 
     nrip_len = svm_nextrip_insn_length(v);
 
-#ifdef NDEBUG
+#ifndef CONFIG_DEBUG
     if ( nrip_len > MAX_INST_LEN )
         gprintk(XENLOG_WARNING, "NRip reported inst_len %lu\n", nrip_len);
     else if ( nrip_len != 0 )
diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 23e06d39ad84..bfdc81934dd7 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -333,9 +333,10 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e);
  * WARNING: This will need to be disabled to run OSes that use the spare PTE
  * bits themselves (e.g., *BSD).
  */
-#ifdef NDEBUG
+#ifndef CONFIG_DEBUG
 #undef _PAGE_GNTTAB
 #endif
+
 #ifndef _PAGE_GNTTAB
 #define _PAGE_GNTTAB   0
 #endif
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5925c5f39cff..378201592bac 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -46,10 +46,10 @@ int remove_xen_ranges(struct rangeset *r);
 
 int cf_check stub_selftest(void);
 
-#ifdef NDEBUG
-# define highmem_start 0
-#else
+#ifdef CONFIG_DEBUG
 extern unsigned long highmem_start;
+#else
+# define highmem_start 0
 #endif
 
 extern unsigned int i8259A_alias_mask;
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 40b02421ff00..834877caaa2d 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -31,12 +31,12 @@
 #define SHADOW_AUDIT_ENTRIES_FULL   0x08  /* Check every shadow */
 #define SHADOW_AUDIT_ENTRIES_MFNS   0x10  /* Check gfn-mfn map in shadows */
 
-#ifdef NDEBUG
-#define SHADOW_AUDIT                   0
-#define shadow_audit_enable        false
-#else
+#ifdef CONFIG_DEBUG
 #define SHADOW_AUDIT                0x15  /* Basic audit of all */
 extern bool shadow_audit_enable;
+#else
+#define SHADOW_AUDIT                   0
+#define shadow_audit_enable        false
 #endif
 
 /******************************************************************************
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 410226d0f01b..5d0e4ead27b6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -60,10 +60,10 @@
  *  dom0:   The NMI is virtualised to DOM0.
  *  ignore: The NMI error is cleared and ignored.
  */
-#ifdef NDEBUG
-static char __read_mostly opt_nmi[10] = "dom0";
-#else
+#ifdef CONFIG_DEBUG
 static char __read_mostly opt_nmi[10] = "fatal";
+#else
+static char __read_mostly opt_nmi[10] = "dom0";
 #endif
 string_param("nmi", opt_nmi);
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 8e0ff799f583..9a430262d6f3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -699,7 +699,7 @@ bool cf_check
 x86_insn_is_cr_access(const struct x86_emulate_state *s,
                       const struct x86_emulate_ctxt *ctxt);
 
-#if !defined(__XEN__) || defined(NDEBUG)
+#if !defined(__XEN__) || !defined(CONFIG_DEBUG)
 static inline void x86_emulate_free_state(struct x86_emulate_state *s) {}
 #else
 void x86_emulate_free_state(struct x86_emulate_state *s);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e2310b9d3c9a..c400dba56155 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -148,16 +148,16 @@ static DEFINE_RSPINLOCK(console_lock);
  * Note, in the above algorithm, to disable rate limiting simply make
  * the lower threshold equal to the upper.
  */
-#ifdef NDEBUG
-#define XENLOG_UPPER_THRESHOLD       3 /* Do not print DEBUG  */
-#define XENLOG_LOWER_THRESHOLD       3 /* Always print INFO, ERR and WARNING */
-#define XENLOG_GUEST_UPPER_THRESHOLD 2 /* Do not print INFO and DEBUG  */
-#define XENLOG_GUEST_LOWER_THRESHOLD 0 /* Rate-limit ERR and WARNING   */
-#else
+#ifdef CONFIG_DEBUG
 #define XENLOG_UPPER_THRESHOLD       4 /* Do not discard anything      */
 #define XENLOG_LOWER_THRESHOLD       4 /* Print everything             */
 #define XENLOG_GUEST_UPPER_THRESHOLD 4 /* Do not discard anything      */
 #define XENLOG_GUEST_LOWER_THRESHOLD 4 /* Print everything             */
+#else
+#define XENLOG_UPPER_THRESHOLD       3 /* Do not print DEBUG  */
+#define XENLOG_LOWER_THRESHOLD       3 /* Always print INFO, ERR and WARNING */
+#define XENLOG_GUEST_UPPER_THRESHOLD 2 /* Do not print INFO and DEBUG  */
+#define XENLOG_GUEST_LOWER_THRESHOLD 0 /* Rate-limit ERR and WARNING   */
 #endif
 /*
  * The XENLOG_DEFAULT is the default given to printks that
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index ea24d29b802d..9a704568dbe5 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -100,7 +100,15 @@ extern bool printk_ratelimit(void);
 #define gprintk(lvl, fmt, args...) \
     printk(XENLOG_GUEST lvl "%pv " fmt, current, ## args)
 
-#ifdef NDEBUG
+#ifdef CONFIG_DEBUG
+
+#define dprintk(lvl, fmt, args...) \
+    printk(lvl "%s:%d: " fmt, __FILE__, __LINE__, ## args)
+#define gdprintk(lvl, fmt, args...) \
+    printk(XENLOG_GUEST lvl "%s:%d:%pv " fmt, \
+           __FILE__, __LINE__, current, ## args)
+
+#else
 
 static inline void
 __attribute__ ((__format__ (__printf__, 2, 3)))
@@ -110,14 +118,6 @@ static inline void
 __attribute__ ((__format__ (__printf__, 2, 3)))
 gdprintk(const char *lvl, const char *fmt, ...) {}
 
-#else
-
-#define dprintk(lvl, fmt, args...) \
-    printk(lvl "%s:%d: " fmt, __FILE__, __LINE__, ## args)
-#define gdprintk(lvl, fmt, args...) \
-    printk(XENLOG_GUEST lvl "%s:%d:%pv " fmt, \
-           __FILE__, __LINE__, current, ## args)
-
 #endif
 
 /* vsprintf.c */
-- 
2.39.5


