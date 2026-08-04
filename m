Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879C1C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382263.1625625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNS-0007L9-Ue; Tue, 04 Aug 2026 15:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382263.1625625; Tue, 04 Aug 2026 15:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNS-0007L2-Rt; Tue, 04 Aug 2026 15:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1382263;
 Tue, 04 Aug 2026 15:48:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNR-0007Jq-FB
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNQ-009GfZ-SJ
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209a3-2eae-0a2a0a5409dd-0a2a450b975e-48
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:24 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c8-b7e8-0a2a450b0019-d155802ca8ce-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:24 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso8471115e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:24 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858504; x=1786463304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqMXCnK01BlYFZDe0+XHyH0PuzocnmSdtMYh4s8i6/I=;
        b=NrCqbKI/e42GXKnbhw/FVaj72OlfJPNqbFXidSkQs8p6efGG4TnQfNIrf6X3s80Vfe
         xDTRcvGW+wJeUwL0a76tdMkEAvk4NHC7HdQ41ozE/7gi+uTM9gkynlAsZ0CFpUe00vl+
         dc+BDeKdRmMGSdW4gBNyBs+zT6Tz8Ooa1WdSn9+dI2YMIGBMYcashyEwqYOuD/090orW
         pY0xqGF5ZNfcFEn93izd2EB7nrlJogsfBdzbFzGbXv3AcIwZ8pCUaQ5MNQD9jB5VqHHy
         jnelwbZILQPwFTZNzU1zVWRz8fG04F5BqsvJEPCVns1mOM+l3SA/r5SJ+SmO+uK1Ea5v
         REGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858504; x=1786463304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqMXCnK01BlYFZDe0+XHyH0PuzocnmSdtMYh4s8i6/I=;
        b=LGg99nNJygfUDPjrnxNDkDgGAujrS2ZyCvGimevc9DqA1vTl0X9+SoDB2tyhM8ttAa
         kmuDJ7mgUHogn3CnEd6UaUm+gPpzcehBD1f8yQRTsm+9CFm7Dgalm1Vh195T63FoAlUN
         2ifg2+jBarurpXzaq2Vq8L6Swq2tVb6lrXQJPgyszx0CAU3I9bOBZfCkr3OIbYdpCA/R
         OT8ss7j7IUwdcLXtOpY30nTWDzHO4yz5uZ+Rjn5F5wWq9HK0Uh+pWbYcNyeUPmw3pluu
         eUV9mS7Tv3YPmkrsg63WJSP+YKIJIgq45XPowUdHmqKzqCKwDfl/yrNpbjNfPpTlKLAM
         3pzA==
X-Gm-Message-State: AOJu0YyI936rsMG3YtpYZWzmSYJi95fCPTYnM1TeanV8dD1bXI6/QyVx
	Y7wZgreNmXVa3Xv7oH7GJluJ5XFgqP1P74Hjmj2Pgd0pw192GCT9GjC3TD9zow==
X-Gm-Gg: AR+sD12ssa4QbH03qv+JiPSZM0buAJomrIIdPs/nCVVBWgtN/mYHlRdNJjarIfo4nK4
	K9qPP59137iLQyv4guJWVWTUomKEQt7mWptqq7yot7xB4daJjLk3/ymgbQbFJ6Z7WlSvuRkrsBU
	Td9W2qMTfzryEsbjoL167RYLWRB4nccg3z8/4NFDluxs5NNxNvmGXfJJlrHWRaeNmr6ViEh6hle
	Y1yDY1m81HgK78p2g0+xMA2VqUvUdt96Cck+jbM7nu/gAKy7KAru1bYgpeV+FHQnuu+340stpXU
	zhT1VfbTvvR73DGw61tm9FL8OxIUY8lctpEL9CH3XgF/nfH5o3183SLX0wt2RqTg0FUiE2PJcVQ
	9ut0QaOLygHTWpglGd9PchQCRUDIlmLq77CTxhulALWFio0728Kv8HzBJUFp25XfM+OUSsYOk3b
	8Y8G5jxTi93PacA8DOd2dKyu1Bk802DNgdz/pdn+8dDMEXzKiWo1az79HNAdHQdiUWloIoAJYM/
	15O6ZY07Yek3jcBndR8pvg6vZbVDhmGhw==
X-Received: by 2002:a05:600c:468d:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-4994e382cacmr889265e9.7.1785858503857;
        Tue, 04 Aug 2026 08:48:23 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 04/20] xen/riscv: introduce guest riscv,isa string
Date: Tue,  4 Aug 2026 17:47:54 +0200
Message-ID: <59b5b69f53ef81d68fd279d9ee0c03f5ffbbc2ae.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785858504-1BED69EA-756EA657/10/73395122804
X-purgate-type: spam
X-purgate-size: 14745

Introduce build_guest_isa_str() to generate the riscv,isa string to be
passed to the guest via the Device Tree riscv,isa property.

Introduce the per-domain guest ISA bitmap, populated during domain
creation by calling init_guest_isa().

Introduce struct riscv_isa_ext_entry with a new guest_supported field
to filter out ISA extensions that should not be exposed to guests:

- f/d/q/v: FPU and vector context save/restore are not yet implemented
  for guests.
- Z*inx are not exposed either: they aren't in riscv_isa_ext[], so they
  can never be set in riscv_isa and thus never reach a guest, and no
  current hardware/guest-OS advertises or expects them. Supporting them
  would be cheaper than F/D/Q (FP values stay in integer registers Xen
  already context-switches), but is left as future work.
- h: Nested virtualisation is not supported.
- sstc: Xen owns the supervisor timer; guests must use SBI.
- svade: Xen manages hardware A/D bit updates in stage-2 page tables.
- svpbmt: Page-based memory types are not yet wired up in stage-2 code.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
- build_guest_isa_str(): drop the struct domain argument and work directly on
  the guest_isa bitmap; make the function static as it has no external users
  anymore.
- build the guest "riscv,isa" string only once, in compute_guest_isa(), and
  store it in an __ro_after_init pointer, instead of rebuilding it for every
  domain: all domains are currently given the same guest ISA, so apply here
  the same reasoning as for the guest_isa bitmap.
- panic() on length calculation, allocation or formatting failure, in line
  with the rest of riscv_fill_hwcap() initialization.
- introduce get_guest_isa_str() accessor and expose it in asm/cpufeature.h
  instead of build_guest_isa_str().
---
Changes in v6:
- build_guest_isa_str() now takes a `const struct domain *d` instead of a
  raw `const unsigned long *isa_bitmap`, to leave room for using more than
  just the bitmap in the future.
- Compute the guest-visible ISA bitmap once at boot, into a new
  __ro_after_init `guest_isa` bitmap (compute_guest_isa(), called at the
  end of riscv_fill_hwcap()), instead of re-deriving it from
  riscv_isa_ext[] on every domain creation in init_guest_isa(). All guests
  currently get the same extension set, so this avoids repeating
  identical work per domain; will need revisiting if/when per-domain ISA
  policy is introduced.
- struct arch_domain's `isa` field is now `const unsigned long *isa`
  instead of an embedded bitmap; init_guest_isa() just points it at the
  shared `guest_isa` bitmap rather than copying bits into a per-domain
  array.
- Mark riscv_isa_ext[] __initconstrel, since its entries hold name pointers
  and the need for relocations requires that the compiler emit the data to
  a writable section.
- Make build_guest_isa_str() __init as it is called during make_cpus_node()
  which is used only (at least, for now) in build time of domain.
---
Changes in v5:
- Introduce struct riscv_isa_ext_entry with a guest_supported field and
  RISCV_ISA_EXT_ENTRY(name, guest_supp) macro for riscv_isa_ext[],
  replacing the ad-hoc guest_unsupp bitmap and init_guest_unsupp().
  Every entry now carries an explicit true/false decision, enforced at
  compile time.
- init_guest_isa() builds d->arch.isa by iterating riscv_isa_ext[]
  directly instead of using bitmap_andnot() against guest_unsupp.
- init_guest_isa() changed to void as it can no longer fail.
- Drop isa_str from struct arch_domain; the ISA string does not need to
  persist over the domain lifetime. build_guest_isa_str() is made
  non-static and declared in cpufeature.h for use when building the
  guest device tree.
- Updated the fix of underflow in build_guest_isa_str().
- Drop unnecessary empty line in cpufeature.h before enum riscv_isa_ext_id.
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
 xen/arch/riscv/cpufeature.c             | 171 ++++++++++++++++++++----
 xen/arch/riscv/domain.c                 |   2 +
 xen/arch/riscv/include/asm/cpufeature.h |   5 +
 xen/arch/riscv/include/asm/domain.h     |   3 +
 4 files changed, 157 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..c963c3d556b4 100644
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
@@ -34,9 +36,35 @@ struct riscv_isa_ext_data {
     .name = #ext_name,                          \
 }
 
+struct riscv_isa_ext_entry {
+    unsigned int id;
+    const char *name;
+    bool guest_supported;
+};
+
+#define RISCV_ISA_EXT_ENTRY(ext_name, guest_supp)       \
+{                                                       \
+    .id              = RISCV_ISA_EXT_ ## ext_name,      \
+    .name            = #ext_name,                       \
+    .guest_supported = guest_supp,                      \
+}
+
 /* Host ISA bitmap */
 static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
 
+/*
+ * ISA bitmap handed out to every guest.
+ *
+ * All guests are given the same extensions for the time being, so this is
+ * computed once out of riscv_isa_ext[] and riscv_isa, rather than redoing
+ * the walk for every domain created.  Should per-domain ISA policy ever be
+ * introduced, this will need to become per-domain again.
+ */
+static __ro_after_init DECLARE_BITMAP(guest_isa, RISCV_ISA_EXT_MAX);
+
+/* "riscv,isa" string corresponding to guest_isa, shared by all domains. */
+static char *__ro_after_init guest_isa_str;
+
 static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
                                          unsigned long *dt_cpuid)
 {
@@ -120,29 +148,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
  * and strncmp() is used in match_isa_ext() to compare extension names instead
  * of strncasecmp().
  */
-const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
-    RISCV_ISA_EXT_DATA(i),
-    RISCV_ISA_EXT_DATA(m),
-    RISCV_ISA_EXT_DATA(a),
-    RISCV_ISA_EXT_DATA(f),
-    RISCV_ISA_EXT_DATA(d),
-    RISCV_ISA_EXT_DATA(q),
-    RISCV_ISA_EXT_DATA(c),
-    RISCV_ISA_EXT_DATA(h),
-    RISCV_ISA_EXT_DATA(zicntr),
-    RISCV_ISA_EXT_DATA(zicsr),
-    RISCV_ISA_EXT_DATA(zifencei),
-    RISCV_ISA_EXT_DATA(zihintpause),
-    RISCV_ISA_EXT_DATA(zihpm),
-    RISCV_ISA_EXT_DATA(zba),
-    RISCV_ISA_EXT_DATA(zbb),
-    RISCV_ISA_EXT_DATA(zbs),
-    RISCV_ISA_EXT_DATA(smaia),
-    RISCV_ISA_EXT_DATA(smstateen),
-    RISCV_ISA_EXT_DATA(ssaia),
-    RISCV_ISA_EXT_DATA(sstc),
-    RISCV_ISA_EXT_DATA(svade),
-    RISCV_ISA_EXT_DATA(svpbmt),
+static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
+    RISCV_ISA_EXT_ENTRY(i,            true),
+    RISCV_ISA_EXT_ENTRY(m,            true),
+    RISCV_ISA_EXT_ENTRY(a,            true),
+    RISCV_ISA_EXT_ENTRY(f,            false),
+    RISCV_ISA_EXT_ENTRY(d,            false),
+    RISCV_ISA_EXT_ENTRY(q,            false),
+    RISCV_ISA_EXT_ENTRY(c,            true),
+    RISCV_ISA_EXT_ENTRY(v,            false),
+    RISCV_ISA_EXT_ENTRY(h,            false),
+    RISCV_ISA_EXT_ENTRY(zicntr,       true),
+    RISCV_ISA_EXT_ENTRY(zicsr,        true),
+    RISCV_ISA_EXT_ENTRY(zifencei,     true),
+    RISCV_ISA_EXT_ENTRY(zihintpause,  true),
+    RISCV_ISA_EXT_ENTRY(zihpm,        true),
+    RISCV_ISA_EXT_ENTRY(zba,          true),
+    RISCV_ISA_EXT_ENTRY(zbb,          true),
+    RISCV_ISA_EXT_ENTRY(zbs,          true),
+    RISCV_ISA_EXT_ENTRY(smaia,        true),
+    RISCV_ISA_EXT_ENTRY(smstateen,    true),
+    RISCV_ISA_EXT_ENTRY(ssaia,        true),
+    RISCV_ISA_EXT_ENTRY(sstc,         false),
+    RISCV_ISA_EXT_ENTRY(svade,        false),
+    RISCV_ISA_EXT_ENTRY(svpbmt,       false),
 };
 
 static const struct riscv_isa_ext_data __initconst required_extensions[] = {
@@ -181,7 +210,7 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 
     for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
     {
-        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
 
         /*
          * `ext->name` (according to initialization of riscv_isa_ext[]
@@ -480,6 +509,98 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+static int __init build_guest_isa_str(char *buf, size_t size)
+{
+    char *p = buf;
+    size_t left = size;
+    int total;
+
+#if defined(CONFIG_RISCV_32)
+    total = snprintf(p, left, "rv32");
+#elif defined(CONFIG_RISCV_64)
+    total = snprintf(p, left, "rv64");
+#else
+# error "Unsupported RISC-V bitness"
+#endif
+
+    if ( total < 0 )
+        return total;
+
+    if ( buf )
+    {
+        if ( (size_t)total >= left )
+            return -ENOSPC;
+
+        p += total;
+        left -= total;
+    }
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
+        int ret;
+
+        if ( !riscv_isa_extension_available(guest_isa, ext->id) )
+            continue;
+
+        ret = snprintf(p, left, "%s%s",
+                       ext->id >= RISCV_ISA_EXT_BASE ? "_" : "",
+                       ext->name);
+        if ( ret < 0 )
+            return ret;
+
+        total += ret;
+
+        if ( buf )
+        {
+            if ( (size_t)ret >= left )
+                return -ENOSPC;
+
+            p += ret;
+            left -= ret;
+        }
+    }
+
+    return total;
+}
+
+static void __init compute_guest_isa(void)
+{
+    int len;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
+
+        if ( ext->guest_supported &&
+             riscv_isa_extension_available(NULL, ext->id) )
+            __set_bit(ext->id, guest_isa);
+    }
+
+    /*
+     * All domains are given the same guest ISA, so the "riscv,isa" string
+     * is built only once here and then shared by all of them.
+     */
+    if ( (len = build_guest_isa_str(NULL, 0)) < 0 )
+        panic("Failed to calculate guest \"riscv,isa\" length: %d\n", len);
+
+    if ( !(guest_isa_str = xvmalloc_array(char, len + 1)) )
+        panic("Failed to allocate guest \"riscv,isa\" string\n");
+
+    if ( build_guest_isa_str(guest_isa_str, len + 1) != len )
+        panic("Failed to build guest \"riscv,isa\" string\n");
+}
+
+void init_guest_isa(struct domain *d)
+{
+    d->arch.isa = guest_isa;
+}
+
+const char *get_guest_isa_str(void)
+{
+    return guest_isa_str;
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +648,6 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
+    compute_guest_isa();
 }
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 2819ff4e7c92..c9933147595e 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,8 @@ int arch_domain_create(struct domain *d,
     if ( is_idle_domain(d) )
         return 0;
 
+    init_guest_isa(d);
+
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index 0c48d57a03bb..2973eb13a513 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -5,6 +5,7 @@
 #ifndef __ASSEMBLER__
 
 #include <xen/stdbool.h>
+#include <xen/types.h>
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
@@ -44,7 +45,11 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+struct domain;
+
 void riscv_fill_hwcap(void);
+void init_guest_isa(struct domain *d);
+const char *get_guest_isa_str(void);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 6044ce0feee0..8ae01a5e4dcc 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -7,6 +7,7 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/cpufeature.h>
 #include <asm/guest-layout.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
@@ -94,6 +95,8 @@ struct arch_domain {
     struct p2m_domain p2m;
 
     struct paging_domain paging;
+
+    const unsigned long *isa;
 };
 
 #include <xen/sched.h>
-- 
2.55.0


