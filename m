Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB65D606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RyrIXYy0
Received: from list by lists.xenproject.org with outflank-mailman.1496607.1695077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU4Rm-0006MK-D2; Thu, 19 Nov 2026 15:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496607.1695077; Thu, 19 Nov 2026 15:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU4Rm-0006MC-AS; Thu, 19 Nov 2026 15:53:14 +0000
Received: by outflank-mailman (input) for mailman id 1496607;
 Thu, 19 Nov 2026 15:48:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cristian.andrei1423@gmail.com>) id 1xU4Mu-00051K-Jt
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:48:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU4Mt-008oGL-P7
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:48:11 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cristian.andrei1423@gmail.com>)
 id 6aff1a35-e002-0a2a0a5209dd-0a2a4501a488-10
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:48:11 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cristian.andrei1423@gmail.com>)
 id 6aff1a3b-5bcc-0a2a45010019-d155dd35f11d-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:48:11 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so949305f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:48:11 -0800 (PST)
Received: from localhost ([2a02:2f0b:8a03:1c01:b817:2e97:f268:2cbf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3882sm247289f8f.49.2026.11.19.07.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 07:48:10 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795103291; x=1795708091; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNS7/es9cdB66xJ/BxsmVpcG5swM8bae0WkYJZF8qY4=;
        b=RyrIXYy0Lg2tW09G6BrMgv7M/c7JmAm51lMXaFJTCsGdNFESnUphduWUNsvueBpGIo
         RkQzUyaphVySSYpZ9A0G3SEjltHUYWi7Uyv0pkhcixAZ03+fYEbt1n5lDRArcjxnrjGP
         GbztamHaQ3+HOnD126mGbj4fjIz8r4sGN+Y4iBUvdrCqeF9QjMax8elnxD3we5SzWYI5
         Og/3E5wy4yceFpZEurB3UwbyK1JUWA2lw3jjHgsDAjcEuTbddGlwtOT6TCnWHB65D89n
         E8kSgHvbYCohc8B6Zne4gG4FoU3mTwfvuL3j95qBbmA1tDQeZ0PI5Tq3FFy79Co7sWZ/
         uu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103291; x=1795708091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNS7/es9cdB66xJ/BxsmVpcG5swM8bae0WkYJZF8qY4=;
        b=J4GHxxL3zEpf7O5sjrzgd2dS2wFt0fAqd/FWr09FHWL4c/vf1TCNOJwpNHkdlAkIT1
         Re76UP7M3doeBjQp4TFJoiaqeFJH/AGMFzKPyDGnB7TCKr+ye02GFOTHpzBykMu2dgNI
         L39hs1qw54gniL+4Ts43XZNseZRHtW4b8bolJnnEvuzjWY4agYUAXqLRzbJEpE6JMqLz
         j/nf/Olk8518qSyxa8eV3p8T91flzk+Zdp/f2yDmaiQtkBJ37Q31++Ir/+dhakwsONtN
         Tw2TtYQQ+4WZP9Yd+PJC6MI8gJRb630c0H4QZsVaIzC4PZ2tHlOZjk71e5bQWVMO14wD
         EKNQ==
X-Gm-Message-State: APuU4Z91TVBeRPkR2Am31DA2oJHxnr4vr4Uo1U0bODhOim3QfhTXphdF
	UGBURLT5zeJhGyzY3vAiPjSOWPxOaoZUJJrgKUHksSxvpv47qU7v/EjL6Ry+UKAZ
X-Gm-Gg: AZFdTZf85QR9vovFsb9GCptCoHbdczCWCRVg8mP8PVQj6+KtJASTNK17Vy/uipJA34p
	LeCrI6v5skY9VcKYHDlrKDTQjq2USStBz/bPrudyib89HzVVogT3vCY6/NkdRdIgDNj+GDuoGlh
	957b7kzMLFfWyjHCy26+WWT7RTFU6aSQBtREMpAhPbd/w/VPl0tAaapFBSKpD7Bb9PlzMiHmIhH
	k+RKzY7xjjwczXEaVp14zxmj5UhWWXo9X7xBuuNNnVZ2uLEXHRu2ya6UKu3q79cDlSvR4exezIV
	o+vWh4SN7FQg0lZPL5Sbf9aob4FFb3FAgNemyauRpH+ydDdO8WgcA8db2uHSJoAAsuXCDHJ6uC2
	uuqH4ieF8kkwRoew1T0BsILIv5oFMwbN90gBYbLtIDFRBcX6j1T/mDjMDaNHfaEfqeKc4twQOv3
	7v/q5JNWxxHuy+EAdnIVzdummLuqc0SFNtl+2nCywe3A0NRWzXLr8CDvU38V8ReEfoH5k6c+kPf
	EMGuByPIPyOIIQuUSK/rR9/sv7YmPgniBohoKqtu58eqe+/ncsjWjep2zMTKSO6IBTj/hAcVt4y
	hFe23cXhsWxmliX3U5w3cpDFc+X1omGV095r6+yTuaU=
X-Received: by 2002:a5d:5888:0:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4a63a1e0211mr12136755f8f.18.1795103290837;
        Thu, 19 Nov 2026 07:48:10 -0800 (PST)
From: cristian.andrei1423@gmail.com
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	alistair.francis@wdc.com,
	connojdavis@gmail.com,
	baptiste.le-duc@vates.tech,
	community.manager@xenproject.org,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	Cristian Andrei <cristian.andrei1423@gmail.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH] xen/riscv: add support for riscv,isa-extensions devicetree property
Date: Thu, 19 Nov 2026 17:48:07 +0200
Message-ID: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795103291-4E9475FD-734CF134/0/0
X-purgate-type: clean
X-purgate-size: 13272
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen panics when a CPU only has the riscv,isa-extensions property in
the device tree. It only accepts the deprecated riscv,isa property,
which forces users to use legacy devicetrees.

Use riscv,isa-extensions if present, otherwise the legacy riscv,isa.
If the new property is used, riscv,isa-extensions and riscv,isa-base
must both be present and riscv,isa-base must exactly match the build
string. Make a new shared helper riscv_isa_ext_check() which returns
the exact state of the property: whether both are present or to use
the legacy property. This helper makes both cpufeature.c and smpboot.c
agree on which property a CPU uses.

A CPU with neither property is skipped with a message. Make it now
an error because a skipped CPU is left out of the intersection, so
Xen could use extensions that CPU lacks.

Add a per-CPU fallback so that any mix of new and legacy CPUs works.
This deviates from Linux, which skips CPUs without riscv,isa-extensions
and could assume extensions those CPUs lack.

Add a first-CPU flag because with the new riscv,isa-extensions, a CPU's
set can now be empty, which would make a later CPU appear as the first
one. This couldn't happen with riscv,isa, where 'i' is always set.

Use the new property in dt_processor_hartid(), with the legacy
fallback, which also only used the legacy riscv,isa during
interrupt-controller setup.

Suggested-by: Denis Mukhin <dmukhin@ford.com>
Signed-off-by: Cristian Andrei <cristian.andrei1423@gmail.com>
---
Tested on QEMU (virt, aia=aplic-imsic, -cpu rv64,svpbmt=on),
-smp 1/2: default DT, only-new, only-legacy, mixed (CPU 0 new,
CPU 1 legacy, showing CPU 1 falling back) boot.
CPU 1 base "rv32i" -> panic.
CPU 1 with only one of the new pair (either one) -> panic.
Neither property: untestable in QEMU as OpenSBI stops first.

 CHANGELOG.md                            |   3 +
 docs/misc/riscv/booting.txt             |   3 +-
 xen/arch/riscv/cpufeature.c             | 135 ++++++++++++++----------
 xen/arch/riscv/include/asm/cpufeature.h |   2 +
 xen/arch/riscv/smpboot.c                |  26 ++++-
 5 files changed, 109 insertions(+), 60 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 225397f128..6bacd64f49 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      afterwards.
 
 ### Added
+ - On RISC-V:
+   - Support for riscv,isa-extensions devicetree cpu property, alongside
+     the legacy riscv,isa.
 
 ### Removed
  - On Arm:
diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
index 14212ed62f..1505ae8c87 100644
--- a/docs/misc/riscv/booting.txt
+++ b/docs/misc/riscv/booting.txt
@@ -2,7 +2,8 @@ System requirements
 ===================
 
 The following extensions are required by Xen. Xen panics at boot if any of
-them is missing from the riscv,isa property of the CPU nodes:
+them is missing from the riscv,isa or riscv,isa-extensions property of the
+CPU nodes:
 - I, M, A, Zicsr, Zifencei:
   Base ISA Xen is compiled for.
 - C:
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b1c614867c..844269df70 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -42,10 +42,11 @@ struct riscv_isa_ext_data {
  *
  * These flags express Xen's policy, not the ISA's rules: extensions which
  * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
- * treatment here, as they can only ever appear in the "riscv,isa" of a host
- * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
- * They are only of use for extensions Xen chooses not to expose to guests of
- * a given width despite the hardware implementing them.
+ * treatment here, as they can only ever appear in the "riscv,isa" or
+ * "riscv,isa-extensions" of a host of that XLEN, and guest_isa is masked
+ * against the host ISA bitmap anyway. They are only of use for extensions
+ * Xen chooses not to expose to guests of a given width despite the hardware
+ * implementing them.
  */
 #define RISCV_ISA_EXT_GUEST_NONE 0
 #define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
@@ -455,10 +456,41 @@ static int __init riscv_isa_parse_string(const char *isa,
     return -EINVAL;
 }
 
-static void __init riscv_fill_hwcap_from_isa_string(void)
+int riscv_isa_ext_check(const struct dt_device_node *cpu)
+{
+    const char *base;
+    const char *expected_base = IS_ENABLED(CONFIG_RISCV_64) ? "rv64i" : "rv32i";
+    const char *node_name = dt_node_full_name(cpu);
+    bool isa_ext_exists = dt_property_read_bool(cpu, "riscv,isa-extensions");
+    bool isa_base_exists = !dt_property_read_string(cpu, "riscv,isa-base",
+                                                    &base);
+
+    if ( isa_ext_exists && isa_base_exists )
+    {
+        if ( !strcmp(base, expected_base) )
+            return 0;
+        else
+        {
+            printk("%s: riscv,isa-base \"%s\" doesn't match %s\n",
+                   node_name, base, expected_base);
+            return -EINVAL;
+        }
+    }
+    else if ( isa_ext_exists || isa_base_exists )
+    {
+        printk("%s: need both riscv,isa-extensions and riscv,isa-base\n",
+               node_name);
+        return -EINVAL;
+    }
+    else
+        return -ENOENT;
+}
+
+static void __init riscv_fill_hwcap_from_dt(void)
 {
     const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
     const struct dt_device_node *cpu;
+    bool first_cpu = true;
 
     if ( !cpus )
     {
@@ -471,6 +503,7 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
         DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
         const char *isa;
         unsigned long cpuid;
+        int ret;
 
         bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 
@@ -483,57 +516,48 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
         if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
             continue;
 
-        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
+        ret = riscv_isa_ext_check(cpu);
+
+        /* Try riscv,isa-extensions, fall back to the deprecated riscv,isa */
+        if ( !ret )
         {
-            printk("Unable to find \"riscv,isa\" devicetree entry "
-                   "for DT's cpu%ld node\n", cpuid);
-            continue;
+            for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
+                if ( dt_property_match_string(cpu, "riscv,isa-extensions",
+                                              riscv_isa_ext[i].name) >= 0 )
+                    __set_bit(riscv_isa_ext[i].id, this_isa);
         }
+        else if ( ret == -ENOENT &&
+                  !dt_property_read_string(cpu, "riscv,isa", &isa) )
+        {
+            for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
+                if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
+                    panic("DT binding: riscv,isa must be lowercase\n");
 
-        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
-            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
-                panic("According to DT binding riscv,isa must be lowercase\n");
-
-        if ( riscv_isa_parse_string(isa, this_isa) )
-            panic("Check riscv,isa in dts file\n");
+            if ( riscv_isa_parse_string(isa, this_isa) )
+                panic("cpu%lu: riscv,isa failed to parse \"%s\"\n",
+                      cpuid, isa);
+        }
+        else if ( ret == -EINVAL )
+            panic("cpu%lu: invalid riscv,isa-base/riscv,isa-extensions\n",
+                  cpuid);
+        else
+            panic("Unable to find \"riscv,isa\" or \"riscv,isa-extensions\" "
+                  "devicetree entry for DT's cpu%lu node\n", cpuid);
 
-        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
+        /*
+         * The intersection may legitimately become empty, so don't use
+         * bitmap_empty(riscv_isa) to detect the first CPU.
+         */
+        if ( first_cpu )
+        {
             bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
+            first_cpu = false;
+        }
         else
             bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
     }
 }
 
-static bool __init has_isa_extensions_property(void)
-{
-    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
-    const struct dt_device_node *cpu;
-
-    if ( !cpus )
-    {
-        printk("Missing /cpus node in the device tree?\n");
-        return false;
-    }
-
-    dt_for_each_child_node(cpus, cpu)
-    {
-        const char *isa;
-
-        if ( !dt_device_type_is_equal(cpu, "cpu") )
-            continue;
-
-        if ( !dt_device_is_available(cpu) )
-            continue;
-
-        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
-            continue;
-
-        return true;
-    }
-
-    return false;
-}
-
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id)
 {
@@ -690,16 +714,10 @@ void __init riscv_fill_hwcap(void)
     bool all_extns_available = true;
     unsigned long tmp;
 
-    riscv_fill_hwcap_from_isa_string();
+    riscv_fill_hwcap_from_dt();
 
     if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
-    {
-        const char *failure_msg = has_isa_extensions_property() ?
-                                  "\"riscv,isa-extension\" isn't supported" :
-                                  "\"riscv,isa\" parsing failed";
-
-        panic("HW capabilities parsing failed: %s\n", failure_msg);
-    }
+        panic("HW cap: no usable CPU node or extension found\n");
 
     if ( csr_read_safe(CSR_STIMECMP, &tmp) )
     {
@@ -707,9 +725,10 @@ void __init riscv_fill_hwcap(void)
                 "SSTC detected; supported for Xen use, but not for guests\n");
 
         /*
-         * As there is no any guarantee that SSTC will be added to riscv,isa
-         * property by OpenSBI(it doesn't add it now) or whatever ran before
-         * Xen, it is needed to set this bit manually.
+         * As there is no any guarantee that SSTC will be added to
+         * riscv,isa or riscv,isa-extensions property by OpenSBI
+         * (it doesn't add it now) or whatever ran before Xen,
+         * it is needed to set this bit manually.
          *
          * Guest isolation is maintained by not setting ENVCFG_STCE in henvcfg.
          */
@@ -745,7 +764,7 @@ void __init riscv_fill_hwcap(void)
         __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
                   riscv_isa);
         printk(XENLOG_WARNING
-               "Svade/Svadu missing from \"riscv,isa\" - probed as %s\n",
+               "Svade/Svadu missing from \"riscv,isa\" or \"riscv,isa-extensions\" - probed as %s\n",
                hw_update ? "svadu" : "svade");
     }
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index d42189e8eb..ef1d0e4889 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -47,6 +47,7 @@ enum riscv_isa_ext_id {
 };
 
 struct domain;
+struct dt_device_node;
 
 void riscv_fill_hwcap(void);
 void init_guest_isa(struct domain *d);
@@ -54,6 +55,7 @@ const char *get_guest_isa_str(void);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
                                    enum riscv_isa_ext_id id);
+int riscv_isa_ext_check(const struct dt_device_node *cpu);
 
 #endif /* __ASSEMBLER__ */
 
diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
index 3b8bf98e20..95c4d650ac 100644
--- a/xen/arch/riscv/smpboot.c
+++ b/xen/arch/riscv/smpboot.c
@@ -7,6 +7,7 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/cpufeature.h>
 
 cpumask_t __read_mostly cpu_online_map;
 cpumask_t __ro_after_init cpu_possible_map;
@@ -77,9 +78,32 @@ int dt_processor_hartid(const struct dt_device_node *node,
         return -ENODEV;
     }
 
+    if ( (ret = riscv_isa_ext_check(node)) == -ENOENT )
+    {
+        printk(XENLOG_DEBUG "CPU with hartid=%#lx has no riscv,isa-base, "
+               "falling back to legacy riscv,isa\n", *hartid);
+        goto fallback_to_riscv_isa;
+    }
+
+    if ( ret )
+        return -ENODEV;
+
+    if ( dt_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
+         dt_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
+         dt_property_match_string(node, "riscv,isa-extensions", "a") < 0 )
+    {
+        printk("CPU with hartid=%#lx does not support ima\n", *hartid);
+        return -ENODEV;
+    }
+
+    return 0;
+
+ fallback_to_riscv_isa:
+
     if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
     {
-        printk("CPU with hartid=%#lx has no \"riscv,isa\" property\n", *hartid);
+        printk("CPU with hartid=%#lx has no \"riscv,isa-base\" or "
+               "\"riscv,isa\" property\n", *hartid);
         return ret;
     }
 
-- 
2.56.0


