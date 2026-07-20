Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718BEC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366952.1616783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPs-0005TW-Dk; Mon, 20 Jul 2026 16:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366952.1616783; Mon, 20 Jul 2026 16:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPs-0005TL-Al; Mon, 20 Jul 2026 16:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1366952;
 Mon, 20 Jul 2026 16:00:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPq-0005Bt-Nk
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPp-00AdEr-TC
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460c-5cb7-0a2a0a5109dd-0a2a450887e0-42
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:25 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4619-f659-0a2a45080019-d155dd2ad1c1-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:25 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso9621760f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:25 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563225; x=1785168025; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q2X5G2Kf4mmDkHK1SaF1TQrXLIPr2aHrkwYphanNOM=;
        b=N50VorBEAMYYTdcD5oABAkZ6PJCDGCoH9Gw2ngC+ZfZa/IGssd9T3qh/26amKgYyz1
         fgNdRumqSYGJ6AG9feFczMGhC/1Ba9/MlrvkRSIPXgjgiCdRWUkzrZw4PswyaAFOhrb0
         6GEq15gxZ5RP9nNPJcaXfLjlP0xT1rs7/9vYAcJxIsmZ/BsXEhGjFow8J5x/8cEAjVCa
         rFi9QYheVkwkoZeyd6ScXRfFnhcnrm0QSJFfQKD73bPmRAJTKgwTuKTFQVLlIVmG/Qu3
         xIGCI3SNXqRayQCvLoFLkK/mi12aUpf4gIvhSNN0Zf3gJooxhhU+JoR9VE2vkhGUtij+
         /+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563225; x=1785168025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q2X5G2Kf4mmDkHK1SaF1TQrXLIPr2aHrkwYphanNOM=;
        b=TbW6l2xxlyktQyIFX6Z0vtEc8+PBLxLBWd4hiZ1/QG6g+rxZYzbg8p1fzqP9HVIQO4
         HrJnTFKDVKaZsnt7kIy+MFGg9Dzo0KIElR/8UazIphoaIQ4LqG3VvshZLMZBK6w7d7Ys
         w86himJEL++g+lDj2zsfyXR0cmQoyykoHJ6wUklKqJqpamUwSYy5LDwRBXGMbrfnBDTl
         3MYlgrO2g/uE5y2dd2W59MrCd6wVn8wArWrLocrTy4/IPowO7OO1WVdRPt/qE6WLSnEm
         i6Dfr3rxYXp0T349ExT2v7X2iVVBgWqDxTIaLHqMZ5erdWH6sSVRownUG8ZRNPBalOTc
         uarA==
X-Gm-Message-State: AOJu0YyzlTtgcde4YixPtaBe9NReYJxLrVFU8MAG/TNMUzDPKlOl0u4k
	bgy35D8qUUHt1jyZZywaY6UB0l5Mbn2wF60GSB4UtyZofZoQ01P0PQa8mwOGmA==
X-Gm-Gg: AR+sD13W0wxkFiNlxv5QlufXJ4kosF6++k0kB7m3u43pGE7UIIS7qX3tmSF5PZhs13h
	/eiPOO2LEij9DDaxliCuzJ4qgLSvN7srEQh3tRt6lqXKAvPD1pBiZHGl9Y7R7VD07pLOznre2Wn
	tzZE+DpWqDVopzAwALX3u8G8ke/TTq7DcmppF6rEmdCqj+0a05DeHNw4RouD1I76yntLNSgyg+B
	tFjNstaWOfGO0cW8XUQTCX0OMQTAOkjI8F186ktceoU35Os7cDfieUOxLvGcQKDgpNS5s3kjD0l
	8yFhtfVUB6sPDApBG8zZTnA5SYi4tbOPPBVblJ0pVlRAKkhnp0dUL2rgIbqtFiNnXmUZp5F7zYv
	MG+ZLGgwIoFuoMbY7Ff9AhQG/kfBYwBd+vAi0rygED0coOF0sFViSmbO5Kqw3XZCWVwYWNqw85a
	3KeL1meukVKsAgJgOgYIR/AFl7W99DTSOB5b185gztgkPNUW0=
X-Received: by 2002:a5d:5d0e:0:b0:46e:8226:96ba with SMTP id ffacd0b85a97d-47f623036aamr18223366f8f.13.1784563224914;
        Mon, 20 Jul 2026 09:00:24 -0700 (PDT)
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
Subject: [PATCH v6 06/23] xen/riscv: introduce guest riscv,isa string
Date: Mon, 20 Jul 2026 17:59:47 +0200
Message-ID: <9f5d1005611daa4ba9e4324950fcfe10adbebc32.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784563225-D7B5987B-7460C020/10/73395122804
X-purgate-type: spam
X-purgate-size: 13301

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
 xen/arch/riscv/cpufeature.c             | 148 ++++++++++++++++++++----
 xen/arch/riscv/domain.c                 |   2 +
 xen/arch/riscv/include/asm/cpufeature.h |   5 +
 xen/arch/riscv/include/asm/domain.h     |   3 +
 4 files changed, 134 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..a016568cce68 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -14,6 +14,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 
 #include <asm/cpufeature.h>
@@ -34,9 +35,32 @@ struct riscv_isa_ext_data {
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
 static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
                                          unsigned long *dt_cpuid)
 {
@@ -120,29 +144,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
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
@@ -181,7 +206,7 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 
     for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
     {
-        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
 
         /*
          * `ext->name` (according to initialization of riscv_isa_ext[]
@@ -480,6 +505,79 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
     return test_bit(id, isa_bitmap);
 }
 
+int __init build_guest_isa_str(char *buf, size_t size, const struct domain *d)
+{
+    const unsigned long *isa_bitmap = d->arch.isa;
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
+        if ( !riscv_isa_extension_available(isa_bitmap, ext->id) )
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
+    for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+    {
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
+
+        if ( ext->guest_supported &&
+             riscv_isa_extension_available(NULL, ext->id) )
+            __set_bit(ext->id, guest_isa);
+    }
+}
+
+void init_guest_isa(struct domain *d)
+{
+    d->arch.isa = guest_isa;
+}
+
 void __init riscv_fill_hwcap(void)
 {
     unsigned int i;
@@ -527,4 +625,6 @@ void __init riscv_fill_hwcap(void)
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
index 0c48d57a03bb..3c2be9f0954c 100644
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
+int build_guest_isa_str(char *buf, size_t size, const struct domain *d);
 
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
2.54.0


