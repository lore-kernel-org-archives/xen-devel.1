Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0543FC4450C
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346276.1604769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lb-0001U3-Do; Fri, 26 Jun 2026 15:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346276.1604769; Fri, 26 Jun 2026 15:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lb-0001RD-6g; Fri, 26 Jun 2026 15:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1346276;
 Fri, 26 Jun 2026 15:46:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8la-0001Eq-5t
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lZ-008hQp-Iu
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ed7-2eae-0a2a0a5409dd-0a2a4509c3ce-18
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:53 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eed-97e6-0a2a45090019-d155a72ab4fb-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:53 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5aea96d09ddso196152e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:53 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488813; x=1783093613; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAgm/yYwskXxJGXI22S3gUIllEquJX3wAHQbVFNRFl0=;
        b=iJlMpiPFcGmq6JyDYPsln8dabcQ0fnKmxN7nJJXTpo69voqr8THS8eoar5X2Uj/MPX
         OOJqloTSImmu+TOabuXPoH17NSwMDT0R+43OjqKdG7/wzNEFBLSTwf3fHAa4GR/cKeSb
         RF5LV+xfCopNBuRr9Z/iqdCbYjM55G/HrfkuIe6ehqrpYudvYtcCNmghVtVt+c18DxE2
         UwlRva19KNAcgT0v+F9XVC1DgLJl9y0VEs68OPVmkAsHYXZkQkr9qTzwB/5Vt7wXlt22
         3gtZACt90PSX4CoPvyN1tp8rO1tndxQvyiw4frc4GgiHoVq9wmpSUFFQB1go62UMqQnj
         obEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488813; x=1783093613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lAgm/yYwskXxJGXI22S3gUIllEquJX3wAHQbVFNRFl0=;
        b=qntZmobKGh7HH+4/tbWvhimmSyKkVlBD8pnt/lxTZjbxwvBfqA1T7beHLqLzV+dPay
         Vpub42Bt5xGOy0sKuSkE0fcEDtQtFPJrqoi8d14YTm4vnjCS6WcD39//kRTMStlM9ARf
         k/ZjQ1vKv8+jpjC84ni77w8TCWX+AP1DnpyqSM9ETxn2Aqp9Sodlc74uE3BosY6jCeBA
         t2XyYLtcNz8FbqZNv6CxE8F7JKl0qCZ8ZRXVl7BQjzVRq0Ymm1R7Qq9Y6GuJhvpoWrAq
         XONpnFrs6vUUTvQnNnAtsCKuC4QLlLAszlENpUKtVKZzez+ZSNCcNfHy2uoYAZ0AVyrj
         Xjeg==
X-Gm-Message-State: AOJu0Yw+fNO1gRAmYSuC7b96o3KwcKbCpTsmATLm1edesmqdkp/SIMZw
	fS48CfGbrxpGhZK1nihL2WdhnbYZZfhggpQePWlzEG3GgLJdh9CWqy7u/gXUxQ==
X-Gm-Gg: AfdE7cn1H2C2Oh5rvOK7KO9hsw4RMYHYPZjDkWNfftz6ZPr1LzxWn+ENkIfPrhamP0t
	x1nYMa0k1nBflAF3sX2yzNhU6+21l6j2EpNGbzyKWTZxAHzZWKmXXyupJUCHHAEpaxLJFEl9asD
	HMhlMcV5yeIBGSnC/y8g8KTAxhDcUomhn1iEdhFugnV3yTqu5J+VykNrdDr8i3O2w+Nc8bvpNIX
	QgiYJ6d96hknUZneZJABmvXy6U3GYpqZV/RNRIwYxrsmFn6P5Wk7dZVmLETZJafCIqk+b5pA0Xe
	lzPmC2ops++Dxiq2mCh41nG5KX376Xf6GB8eA89hl/0rgAb9SwmFpWbQhlGEuajQpUFUbouvPx9
	DFBPrYkpEg0asD4NJ3fSamoKAHU+d1IUfhI3/nQYB9k7hnWDDyV1qlA0JB9han5yeequNOo2dFd
	tl72f/uz7+BD2kOOJeJtTj19thPfC8TLC+KpLvI5BYSYAyZsRISZKRTtcrxZX1t6nq2lni
X-Received: by 2002:a05:6512:130e:b0:5ae:9d13:e610 with SMTP id 2adb3069b0e04-5aea1f6958dmr1970457e87.37.1782488812647;
        Fri, 26 Jun 2026 08:46:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 08/25] xen/riscv: introduce guest riscv,isa string
Date: Fri, 26 Jun 2026 17:46:17 +0200
Message-ID: <b2678a5697112d3ac16a98b86433da22374324b2.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782488813-54785986-483B4FAF/10/73395122804
X-purgate-type: spam
X-purgate-size: 8878

Introduce generation of the riscv,isa string passed to the guest via the
Device Tree riscv,isa property.

Introduce the per-domain isa string and guest isa bitmap, populated
during domain creation by calling init_guest_isa().

Introduce guest_unsupp to filter out ISA extensions that should not be
exposed to guests:

- f/d/q/v: FPU and vector context save/restore are not yet implemented
  for guests.
- Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they can
  never be set in riscv_isa and thus never reach a guest, and no current
  hardware/guest-OS advertises or expects them. Supporting them would be
  cheaper than F/D/Q (FP values stay in integer registers Xen already
  context-switches), but is left as future work.
- h: Nested virtualisation is not supported.
- sstc: Xen owns the supervisor timer; guests must use SBI.
- svade: Xen manages hardware A/D bit updates in stage-2 page tables.
- svpbmt: Page-based memory types are not yet wired up in stage-2 code.

Drop __initconst for riscv_isa_ext() as it can be used after init stage
by init_guest_isa().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Add an explicit overflow guard in build_guest_isa_str(): return
   -ENOSPC when buf is non-NULL and total >= size, to avoid the
   size - total underflow being passed to snprintf().
 - Expand the commit message to explain why Zfinx/Zdinx/Zqinx are not
   added to guest_unsupp (not in riscv_isa_ext[], so never set in
   riscv_isa nor exposed to a guest; left as future work)
---
Changes in v3:
 - s/set_bit/__set_bit in init_guest_unsupp() as atomicity isn't needed at
   init time.
 - Drop RISCV_GUEST_ISA_STR_MAX; allocate isa_str dynamically with
   xvmalloc_array().
 - Drop "guest" prefix from d->arch.guest_isa and d->arch.guest_isa_str.
 - Introduce build_guest_isa_str() using snprintf(NULL, 0, ...) to determine
   the needed buffer size; init_guest_isa() calls it once for sizing and once
   to fill, keeping both in a single function so they can't go out of sync.
 - Scope ret inside the loop; initialize total directly from the prefix
   snprintf().
 - Merge "_" separator and extension name into a single snprintf() with
   "%s%s".
 - Replace ASSERT with an explicit error check: if the fill call returns a
   different length, free isa_str and return -EINVAL.
---
Changes in v2:
 - s/guest_unsupp_bmp/guest_unsupp.
 - Drop guest_isa_str.
 - Provide init_guest_isa() instead of polluting match_isa_ext().
 - Drop xlen.
 - Add the comment about guest_unsupp.
 - Update the way how guest_unsupp is init-ed.
 - Drop __initconst for riscv_isa_ext[] as it is used in init_guest_isa()
   which isn't marked as __init as it could be used after init stage.
---
---
 xen/arch/riscv/cpufeature.c             | 88 ++++++++++++++++++++++++-
 xen/arch/riscv/domain.c                 |  3 +
 xen/arch/riscv/include/asm/cpufeature.h |  4 ++
 xen/arch/riscv/include/asm/domain.h     |  4 ++
 4 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..b85af09d65c9 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -14,7 +14,9 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
@@ -120,7 +122,7 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
  * and strncmp() is used in match_isa_ext() to compare extension names instead
  * of strncasecmp().
  */
-const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
+const struct riscv_isa_ext_data riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(i),
     RISCV_ISA_EXT_DATA(m),
     RISCV_ISA_EXT_DATA(a),
@@ -128,6 +130,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(d),
     RISCV_ISA_EXT_DATA(q),
     RISCV_ISA_EXT_DATA(c),
+    RISCV_ISA_EXT_DATA(v),
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicntr),
     RISCV_ISA_EXT_DATA(zicsr),
@@ -160,6 +163,12 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(svpbmt),
 };
 
+/*
+ * Everything in riscv_isa_ext[] which shouldn't be exposed to guests should
+ * appear here.
+ */
+static __ro_after_init DECLARE_BITMAP(guest_unsupp, RISCV_ISA_EXT_MAX);
+
 static bool __init is_lowercase_extension_name(const char *str)
 {
     /*
@@ -480,6 +489,81 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+static int build_guest_isa_str(char *buf, size_t size,
+                               const unsigned long *isa_bitmap)
+{
+    int total;
+
+#if defined(CONFIG_RISCV_32)
+    total = snprintf(buf, size, "rv32");
+#elif defined(CONFIG_RISCV_64)
+    total = snprintf(buf, size, "rv64");
+#else
+#   error "Unsupported RISC-V bitness"
+#endif
+
+    if ( total < 0 )
+        return total;
+
+    if ( buf && ((size_t)total >= size) )
+        return -ENOSPC;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        int ret;
+
+        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
+            continue;
+
+        ret = snprintf(buf ? buf + total : NULL,
+                       buf ? size - total : 0, "%s%s",
+                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
+                       ext->name);
+        if ( ret < 0 )
+            return ret;
+        total += ret;
+    }
+
+    return total;
+}
+
+int init_guest_isa(struct domain *d)
+{
+    int len;
+
+    bitmap_andnot(d->arch.isa, riscv_isa, guest_unsupp,
+                  RISCV_ISA_EXT_MAX);
+
+    len = build_guest_isa_str(NULL, 0, d->arch.isa);
+    if ( len < 0 )
+        return len;
+
+    d->arch.isa_str = xvmalloc_array(char, len + 1);
+    if ( !d->arch.isa_str )
+        return -ENOMEM;
+
+    if ( build_guest_isa_str(d->arch.isa_str, len + 1, d->arch.isa) != len )
+    {
+        XVFREE(d->arch.isa_str);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void __init init_guest_unsupp(void)
+{
+    __set_bit(RISCV_ISA_EXT_f, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_d, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_q, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_v, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_h, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_sstc, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_svade, guest_unsupp);
+    __set_bit(RISCV_ISA_EXT_svpbmt, guest_unsupp);
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +611,6 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
+    init_guest_unsupp();
 }
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c92..e4a8c27ea9cb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,9 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
+    if ( (rc = init_guest_isa(d)) != 0 )
+        goto fail;
+
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03bb..866e0f6e7bb7 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -17,6 +17,7 @@
  */
 #define RISCV_ISA_EXT_BASE  26
 
+
 enum riscv_isa_ext_id {
     RISCV_ISA_EXT_a,
     RISCV_ISA_EXT_c,
@@ -44,7 +45,10 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+struct domain;
+
 void riscv_fill_hwcap(void);
+int init_guest_isa(struct domain *d);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6044ce0feee0..459896c04b41 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/cpufeature.h>
 #include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
@@ -94,6 +95,9 @@ struct arch_domain {
     struct p2m_domain p2m;
 
     struct paging_domain paging;
+
+    DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+    char *isa_str;
 };
 
 #include <xen/sched.h>
-- 
2.54.0


