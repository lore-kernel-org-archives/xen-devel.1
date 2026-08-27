Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF62AC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400813.1636381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt8-0003jz-HF; Thu, 27 Aug 2026 15:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400813.1636381; Thu, 27 Aug 2026 15:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt8-0003jT-D7; Thu, 27 Aug 2026 15:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1400813;
 Thu, 27 Aug 2026 15:19:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt6-0003cU-PJ
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbt6-004jSy-5z
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:32 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90555c-bab6-0a2a0a5309dd-0a2a4505b6ea-40
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:32 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905583-4cb1-0a2a45050019-d155dd2af0c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:32 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f59f25ec4so1184763f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:32 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843971; x=1788448771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5FTZ/zgLxaDF0xhm1MbqyrNw+Htw5MQMnzKgTC6ue3Y=;
        b=Zsygbn9FWAId3yuh+IRD0TlI7CnIqpHJaNG1UiVrovfxJrbQjtwO1/vrcWv0CrqIhR
         0DGlLe+0ZUB7G9bucR+G/U6PZlHYRIHGc58eqSeFjrxzQmdSaY6WtIat9BEGqjiIX5oC
         neuETQLIkOvswDx7LDSRdxZs6bVEP/GYQ7GFWkU1ac0mdiQG9laSoG+Bxk2xPonbCUX/
         QkGQ8gLaEBDDfcJN4zug0pEZm7I6usO/oV/30fo0eSqxiPZcoNYUTgEUwy23bRiJr+xx
         8WNLpttTnBv8jBu7TWhNduGKcHHbNsrZwSR5oLYxzOQ5PIRYFD7l9zGILq2aaq5nFzod
         BiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843971; x=1788448771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5FTZ/zgLxaDF0xhm1MbqyrNw+Htw5MQMnzKgTC6ue3Y=;
        b=Ql26JcE7ofq/N6GdHNjnzFyDVkE+wgaCqGyImJYHybEZ315h1sNIATJW8BVro08IU0
         2EdgG5optTKL2hNJCAGZn7KbMdf6GAt4CjDePT4T7HoV7uHOxkKL22J67OOqDTgLDsxA
         dhq2IkpD1aSvxxoGksfOE4oh0HNu4USQJO47p0bAP1L2Pjkkaae4n6O3GtVXnft2uQEU
         4grs4vQWWpCNQIawfMpGlNGRCeknN34DyIN4Og844tmPw0/EdfJ6a97e6h21tQB3yFiG
         UAwBSVep3j4PnqaDFwSMd9+ZojdKrZxrRpzfmfcFaEwjpiWlkHTep0DOkOo1Kh8S96Ir
         otRw==
X-Gm-Message-State: AFuF++lnQ7N6nXtWlsr/2UA7sSdqvrDrlBNj34apt8JT/AUgtGi8npjr
	W4oLsl7x96Vg66hckUuTs9KRd+p8xLhlTvOG+NoI5gXOfP6N4s0v8oRasIASlg==
X-Gm-Gg: AR+sD13xrpUAsLSIDM2OImf+x+BHhUibL1Oddi7p7+SGjoZaDETMRr9b1kC089Dw/Nk
	lXbo0oK2rbt0gwjWwKslvk1C10LOM/tFLjFFXMRggmE8TobG6zXiw3Zu/t7YiJjJxluWELtA1R9
	xjk9u07AuhHEklAeymVCtXYH17YLLF0xo0bvxcS3aKWuUJIN5GmeNTNMV2eH9NnSUJaH3Tr00Js
	/ZxfP81i9NT6RBqO8hXA3Qd4cyZ6eBTkFAtNWBj4ydCYk/MLv6EHz1VqOVEjCGXntDWu80QKDwr
	J3VSGp+sjDzg1rR/hIxYwBTAVFpDm/MUT9BnRQ6uVkF6ywy6DE/jm90RHembFA5TZZuFoFmTBxA
	JVMS3+UHRegbWo7ACZr2FCFjFIoQ0MIUZCBaBAWn6Kq2J6nNfs6+FU+F507u9Rq3rA+ELz2WcwJ
	rCsuoshfV58nqdWTU0fy05WgEU4ayrwn/EHZfkoLMy410VxX83kSoRGqZq4hzuFspqN3Bwo8xMD
	0LrpcdmqX6zkrPGm9hMSdruD9aVG9HU
X-Received: by 2002:a05:6000:22c2:b0:482:e658:bb7f with SMTP id ffacd0b85a97d-482e658bdafmr14865213f8f.15.1787843971337;
        Thu, 27 Aug 2026 08:19:31 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
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
Subject: [PATCH v8 04/20] xen/riscv: introduce guest riscv,isa string
Date: Thu, 27 Aug 2026 17:18:57 +0200
Message-ID: <2eb660bd05c6bf5946a7eae09406266db0c5108f.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1787843972-F7ABF2A1-64796977/10/73395122804
X-purgate-type: spam
X-purgate-size: 16987

Introduce build_guest_isa_str() to generate the riscv,isa string to be
passed to the guest via the Device Tree riscv,isa property.

Introduce the per-domain guest ISA bitmap, populated during domain
creation by calling init_guest_isa().

Introduce struct riscv_isa_ext_entry with a new guest_flags field
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
Changes in v8:
- Replace struct riscv_isa_ext_entry's bool guest_supported with an
  unsigned int guest_flags bitmask (RISCV_ISA_EXT_GUEST_{NONE,RV32,RV64,ANY}),
  so an extension can be withheld from guests of one XLEN only; select the
  bit matching the guest's width with RISCV_ISA_EXT_GUEST_XLEN in
  compute_guest_isa(). Guests are currently of the same width as Xen, so
  RISCV_ISA_EXT_GUEST_XLEN is derived from CONFIG_RISCV_{32,64} for now.
- Add some spaces between # and "error" in build_guest_isa_str().
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
 xen/arch/riscv/cpufeature.c             | 200 +++++++++++++++++++++---
 xen/arch/riscv/domain.c                 |   2 +
 xen/arch/riscv/include/asm/cpufeature.h |   5 +
 xen/arch/riscv/include/asm/domain.h     |   3 +
 4 files changed, 186 insertions(+), 24 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 92235fdfd5ab..4bcbf56cb694 100644
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
@@ -34,9 +36,64 @@ struct riscv_isa_ext_data {
     .name = #ext_name,                          \
 }
 
+/*
+ * Which guests an extension may be handed out to, by guest XLEN.
+ *
+ * These flags express Xen's policy, not the ISA's rules: extensions which
+ * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
+ * treatment here, as they can only ever appear in the "riscv,isa" of a host
+ * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
+ * They are only of use for extensions Xen chooses not to expose to guests of
+ * a given width despite the hardware implementing them.
+ */
+#define RISCV_ISA_EXT_GUEST_NONE 0
+#define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
+#define RISCV_ISA_EXT_GUEST_RV64 (1U << 1)
+#define RISCV_ISA_EXT_GUEST_ANY  (RISCV_ISA_EXT_GUEST_RV32 | \
+                                  RISCV_ISA_EXT_GUEST_RV64)
+
+/*
+ * Guests are of the same width as Xen itself for the time being; once guest
+ * XLEN can differ from host XLEN (hstatus.VSXL), this becomes a per-domain
+ * property, just as guest_isa below does.
+ */
+#if defined(CONFIG_RISCV_32)
+#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV32
+#elif defined(CONFIG_RISCV_64)
+#define RISCV_ISA_EXT_GUEST_XLEN RISCV_ISA_EXT_GUEST_RV64
+#else
+# error "Unsupported RISC-V bitness"
+#endif
+
+struct riscv_isa_ext_entry {
+    unsigned int id;
+    const char *name;
+    unsigned int guest_flags;
+};
+
+#define RISCV_ISA_EXT_ENTRY(ext_name, guest_flgs)       \
+{                                                       \
+    .id          = RISCV_ISA_EXT_ ## ext_name,          \
+    .name        = #ext_name,                           \
+    .guest_flags = guest_flgs,                          \
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
@@ -120,29 +177,30 @@ static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
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
+    RISCV_ISA_EXT_ENTRY(i,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(m,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(a,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(f,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(d,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(q,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(c,            RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(v,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(h,            RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(zicntr,       RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zicsr,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zifencei,     RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zihintpause,  RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zihpm,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zba,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zbb,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(zbs,          RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(smaia,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(smstateen,    RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(ssaia,        RISCV_ISA_EXT_GUEST_ANY),
+    RISCV_ISA_EXT_ENTRY(sstc,         RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(svade,        RISCV_ISA_EXT_GUEST_NONE),
+    RISCV_ISA_EXT_ENTRY(svpbmt,       RISCV_ISA_EXT_GUEST_NONE),
 };
 
 static const struct riscv_isa_ext_data __initconst required_extensions[] = {
@@ -181,7 +239,7 @@ static void __init match_isa_ext(const char *name, const char *name_end,
 
     for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
     {
-        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
+        const struct riscv_isa_ext_entry *ext = &riscv_isa_ext[i];
 
         /*
          * `ext->name` (according to initialization of riscv_isa_ext[]
@@ -480,6 +538,98 @@ bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
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
+#   error "Unsupported RISC-V bitness"
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
+        if ( (ext->guest_flags & RISCV_ISA_EXT_GUEST_XLEN) &&
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
@@ -527,4 +677,6 @@ void __init riscv_fill_hwcap(void)
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


