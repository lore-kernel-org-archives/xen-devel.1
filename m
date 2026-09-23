Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F9CC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430614.1653151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvs-0006qn-7Z; Wed, 23 Sep 2026 13:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430614.1653151; Wed, 23 Sep 2026 13:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Mvs-0006qe-4Q; Wed, 23 Sep 2026 13:22:44 +0000
Received: by outflank-mailman (input) for mailman id 1430614;
 Wed, 23 Sep 2026 13:22:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Mvq-0006mf-P8
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:22:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Mvq-00BQNW-6A
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:22:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2a0-bab6-0a2a0a5309dd-0a2a4505baa4-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:42 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d2a0-4cb1-0a2a45050019-4a7de52b89b6-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:22:41 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-328664ef791so589003eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:22:41 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169760; x=1790774560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbxGSR1jQ3mjsiUMVexNy6mEJBAK/pzPmYIAHajWfls=;
        b=qocp88/wkP0t8BjAd7rbxnEA+U6ZzprwmqcPj3rLSA/PXGs/bJ5wUmHZA9PYYM3VDl
         o3JVALAbeH4ZgfcKmG7ZTlCPQEI3LYcygCXRce7h/JsJaAtRdXt5BP5KatIQk+c/Twrv
         S+4ULR4VXNNhh7z6DezMnREGG4extzhbKYe1K5hZpkz9q0BIsdlnSJ8Uqh7XefENfvnj
         OtpjVkQvYeTNFV2R15LS2RcODx6PgfL8oAa2SgB69FT4zOtassPvxTv/gW4arjeiMdjx
         DSGQWxDFbxJta7UJKQCNPWMI0mZXews93Bf90cFx8c3HUQUA3Lla3qCBfeZ86DXQt8yu
         e9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169760; x=1790774560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbxGSR1jQ3mjsiUMVexNy6mEJBAK/pzPmYIAHajWfls=;
        b=niSxSY06qFmM/n9rXbn4OqR457MZ14ACCA3RFf5bRK9hMQd1EoQEjnrj4hfh9qZ9SN
         95OBFWCGOlBdNd0TBr5OpQ6cHofClXlG63olrxar9M/T16UuLk7CfxgZHz3WnycTlaiG
         f6VY2wNh0TAjQAqRhtbtE8NWKT3eSiQ5tFKSGysWxQOlJ7QHddvrS6eUH91Vkd1XbVeW
         VAxmJ+H9ASzhMRl0yONfM4jcTjwH+disZPmSnHGY7zb2g4KSfu7ySFaEF+fpxRCSWzIx
         DIhuyTM4trJeIYPi1WcJd5KLmV93BilNMsQ49zPj9+xcUfZSyYnP9z9iVl6piD19rvMc
         KHkA==
X-Forwarded-Encrypted: i=1; AKwUvBwdM17/IGebw044Cod+xwG9nG6gTFOZSxzHmml2ImvBsTyTzDJs+bcP20oPLIUMw1AIsna5G33PzK8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kkOxz3HRb3LLJh/k+ITEPuCAlQB7uHfdZjAlOigE31u+u4dSea
	dPrhK4Pe/Zc5UnhpM7FU7QWuUkdhFTtw/eRTirTW2bWush95zvVCW9GR
X-Gm-Gg: AYBFou0K9zUGMW25pX133COFT1Vmn6dwld2wyuwY8ix+D4gihgtry1GjaNBqDh4KE02
	RjNaCEHd5YdyXHaUx6cSs37ntQS+jgmq80ct16IsFU9qXj14NZ/2mYPpcD0tA+GfUCHhHRQTfx9
	tGktkzjhm9r0RB3AYei14hQqu488gzQjPsqEkW6M8SDOMLEN8pzUwBvGpADot+7otsPlS/nr8qQ
	auX7H5ecbZDpUGpa/KSW19c73A3IJ36RaQCAWU9LoqnU3wVjR9O6y2UlDqkdMKFWtYx5d2ZXkaz
	g34PSBYHtVWCA9roGaa1a5aMAtzlfyQrZ2W7u8Z+VrhllSbCON7MTUKOVhly1+N5SzeemDhtmu0
	xJVEWyeFl42w+79QiQkNLjjeIOucBM+01NKilfjQPAzL0I/UkhNAcDq/7BE6zboJV9pyMH85YGk
	ZP+EoO6tw1P/U3+UM4PobehMPmXPai9T1OSTXWN+uHHy8dHyjvMaEWc0DMf81lcnt5wG7WRyidl
	kMoJTl4f5uGaK0+hz379aCCWuqMiwI=
X-Received: by 2002:a05:7300:fb0a:b0:339:66ff:51b3 with SMTP id 5a478bee46e88-33e8e2b67b8mr2443005eec.37.1790169759593;
        Wed, 23 Sep 2026 06:22:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 035/114] target/riscv: gate CPU types with TargetInfo
Date: Wed, 23 Sep 2026 21:15:09 +0800
Message-ID: <20260923131635.1894-36-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169762-F7ABF2A1-CDA8A535/0/0
X-purgate-type: clean
X-purgate-size: 14802

- Gate CPU types with TypeInfo.is_available instead of
  TARGET_RISCV32/64: DEFINE_RISCV_CPU_AVAIL, DEFINE_RISCV64_CPU,
  and DEFINE_RISCV_CPU_32_64SYS.
- Add RISCVCPUDef.target_init. max and bare keep RV64/SV57 in
  the TypeInfo; on riscv32 the callbacks set RV32/SV32 after
  merge. Do not inherit the parent pointer.
- Validate RV64/128 misa_mxl_max only when not target_riscv32().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/cpu.c | 128 ++++++++++++++++++++++++++++++---------------
 target/riscv/cpu.h |   7 +++
 2 files changed, 93 insertions(+), 42 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c6f17390755..4343f431d62 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1586,18 +1586,37 @@ static const MISAExtInfo misa_ext_info_arr[] = {
     MISA_EXT_INFO(RVB, "b", "Bit manipulation (Zba_Zbb_Zbs)")
 };
 
+static void riscv_max_target_init(RISCVCPUClass *mcc)
+{
+    if (!target_riscv32()) {
+        return;
+    }
+    mcc->def->misa_mxl_max = MXL_RV32;
+    mcc->def->cfg.max_satp_mode = VM_1_10_SV32;
+}
+
+static void riscv_bare_target_init(RISCVCPUClass *mcc)
+{
+    if (!target_riscv32()) {
+        return;
+    }
+    /* BARE has no misa_mxl_max, so the class_base_init satp clamp skips it. */
+    mcc->def->cfg.max_satp_mode = VM_1_10_SV32;
+}
+
 static void riscv_cpu_validate_misa_mxl(RISCVCPUClass *mcc)
 {
     CPUClass *cc = CPU_CLASS(mcc);
 
     /* Validate that MISA_MXL is set properly. */
     switch (mcc->def->misa_mxl_max) {
-#ifdef TARGET_RISCV64
     case MXL_RV64:
     case MXL_RV128:
+        if (target_riscv32()) {
+            g_assert_not_reached();
+        }
         cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
         break;
-#endif
     case MXL_RV32:
         cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
         break;
@@ -3092,6 +3111,8 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
 
     if (pcc->def) {
         mcc->def = g_memdup2(pcc->def, sizeof(*pcc->def));
+        /* TypeInfo supplies target_init; do not inherit the parent pointer. */
+        mcc->def->target_init = NULL;
     } else {
         mcc->def = g_new0(RISCVCPUDef, 1);
     }
@@ -3152,6 +3173,9 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
             mcc->def->custom_csrs = def->custom_csrs;
         }
 #endif
+        if (def->target_init) {
+            def->target_init(mcc);
+        }
     }
 
     if (!object_class_is_abstract(c)) {
@@ -3262,6 +3286,7 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         .name = (type_name),                                \
         .parent = (parent_type_name),                       \
         .abstract = true,                                   \
+        .is_available = target_is_base_riscv,               \
         .class_data = &(const RISCVCPUDef) {                \
              .priv_spec = RISCV_PROFILE_ATTR_UNUSED,        \
              .vext_spec = RISCV_PROFILE_ATTR_UNUSED,        \
@@ -3270,10 +3295,11 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         },                                                  \
     }
 
-#define DEFINE_RISCV_CPU(type_name, parent_type_name, ...)  \
+#define DEFINE_RISCV_CPU_AVAIL(type_name, parent_type_name, avail, ...) \
     {                                                       \
         .name = (type_name),                                \
         .parent = (parent_type_name),                       \
+        .is_available = (avail),                            \
         .class_data = &(const RISCVCPUDef) {                \
              .priv_spec = RISCV_PROFILE_ATTR_UNUSED,        \
              .vext_spec = RISCV_PROFILE_ATTR_UNUSED,        \
@@ -3282,8 +3308,37 @@ void riscv_isa_write_fdt(RISCVCPU *cpu, void *fdt, char *nodename)
         },                                                  \
     }
 
+#define DEFINE_RISCV_CPU(type_name, parent_type_name, ...)  \
+    DEFINE_RISCV_CPU_AVAIL(type_name, parent_type_name,     \
+                           target_is_base_riscv, __VA_ARGS__)
+
+#define DEFINE_RISCV64_CPU(type_name, parent_type_name, ...) \
+    DEFINE_RISCV_CPU_AVAIL(type_name, parent_type_name,     \
+                           target_is_riscv64, __VA_ARGS__)
+
+/*
+ * Original:
+ *   #if defined(TARGET_RISCV32) || \
+ *       (defined(TARGET_RISCV64) && !defined(CONFIG_USER_ONLY))
+ *
+ * RV32 models on every riscv32 binary, and on system riscv64
+ * (-cpu rv32 / e31 / ibex). Not linux-user riscv64.
+ */
+static bool riscv32_64sys_available(const TargetInfo *ti)
+{
+#ifdef CONFIG_USER_ONLY
+    return target_is_riscv32(ti);
+#else
+    return target_is_base_riscv(ti);
+#endif
+}
+
+#define DEFINE_RISCV_CPU_32_64SYS(type_name, parent_type_name, ...) \
+    DEFINE_RISCV_CPU_AVAIL(type_name, parent_type_name,     \
+                           riscv32_64sys_available, __VA_ARGS__)
+
 #define DEFINE_PROFILE_CPU(type_name, parent_type_name, profile_)    \
-    DEFINE_RISCV_CPU(type_name, parent_type_name,             \
+    DEFINE_RISCV64_CPU(type_name, parent_type_name,             \
         .profile = &(profile_))
 
 static void riscv_cpu_instance_finalize(Object *obj)
@@ -3311,6 +3366,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_common_class_init,
         .class_base_init = riscv_cpu_class_base_init,
+        .is_available = target_is_base_riscv,
     },
 
     DEFINE_ABSTRACT_RISCV_CPU(TYPE_RISCV_DYNAMIC_CPU, TYPE_RISCV_CPU,
@@ -3339,21 +3395,14 @@ static const TypeInfo riscv_cpu_type_infos[] = {
          * only MBARE will be available if the user doesn't enable
          * a mode manually (see riscv_cpu_satp_mode_finalize()).
          */
-#ifdef TARGET_RISCV32
-        .cfg.max_satp_mode = VM_1_10_SV32,
-#else
         .cfg.max_satp_mode = VM_1_10_SV57,
-#endif
+        .target_init = riscv_bare_target_init,
     ),
 
     DEFINE_RISCV_CPU(TYPE_RISCV_CPU_MAX, TYPE_RISCV_DYNAMIC_CPU,
-#if defined(TARGET_RISCV32)
-        .misa_mxl_max = MXL_RV32,
-        .cfg.max_satp_mode = VM_1_10_SV32,
-#elif defined(TARGET_RISCV64)
         .misa_mxl_max = MXL_RV64,
         .cfg.max_satp_mode = VM_1_10_SV57,
-#endif
+        .target_init = riscv_max_target_init,
     ),
 
     DEFINE_ABSTRACT_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_E, TYPE_RISCV_VENDOR_CPU,
@@ -3378,9 +3427,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.pmp_regions = 8
     ),
 
-#if defined(TARGET_RISCV32) || \
-    (defined(TARGET_RISCV64) && !defined(CONFIG_USER_ONLY))
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE32, TYPE_RISCV_DYNAMIC_CPU,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_BASE32, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV32,
         .misa_mxl_max = MXL_RV32,
 
@@ -3406,7 +3453,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_svvptc = true,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_IBEX, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_IBEX, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV32,
         .misa_ext = RVI | RVM | RVC | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
@@ -3423,37 +3470,35 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_xlrbr = true
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_E31, TYPE_RISCV_CPU_SIFIVE_E,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_SIFIVE_E31, TYPE_RISCV_CPU_SIFIVE_E,
         .misa_mxl_max = MXL_RV32
     ),
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_E34, TYPE_RISCV_CPU_SIFIVE_E,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_SIFIVE_E34, TYPE_RISCV_CPU_SIFIVE_E,
         .misa_mxl_max = MXL_RV32,
         .misa_ext = RVF,  /* IMAFCU */
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_U34, TYPE_RISCV_CPU_SIFIVE_U,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_SIFIVE_U34, TYPE_RISCV_CPU_SIFIVE_U,
         .misa_mxl_max = MXL_RV32,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RV32I, TYPE_RISCV_BARE_CPU,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_RV32I, TYPE_RISCV_BARE_CPU,
         .misa_mxl_max = MXL_RV32,
         .misa_ext = RVI
     ),
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RV32E, TYPE_RISCV_BARE_CPU,
+    DEFINE_RISCV_CPU_32_64SYS(TYPE_RISCV_CPU_RV32E, TYPE_RISCV_BARE_CPU,
         .misa_mxl_max = MXL_RV32,
         .misa_ext = RVE
     ),
-#endif
 
-#if (defined(TARGET_RISCV64) && !defined(CONFIG_USER_ONLY))
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_MAX32, TYPE_RISCV_DYNAMIC_CPU,
+#ifndef CONFIG_USER_ONLY
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_MAX32, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV32,
         .misa_mxl_max = MXL_RV32,
     ),
 #endif
 
-#if defined(TARGET_RISCV64)
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE64, TYPE_RISCV_DYNAMIC_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_BASE64, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
         .misa_mxl_max = MXL_RV64,
 
@@ -3479,19 +3524,19 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_svvptc = true,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_E51, TYPE_RISCV_CPU_SIFIVE_E,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_SIFIVE_E51, TYPE_RISCV_CPU_SIFIVE_E,
         .misa_mxl_max = MXL_RV64
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SIFIVE_U54, TYPE_RISCV_CPU_SIFIVE_U,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_SIFIVE_U54, TYPE_RISCV_CPU_SIFIVE_U,
         .misa_mxl_max = MXL_RV64,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SHAKTI_C, TYPE_RISCV_CPU_SIFIVE_U,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_SHAKTI_C, TYPE_RISCV_CPU_SIFIVE_U,
         .misa_mxl_max = MXL_RV64,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_THEAD_C906, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_THEAD_C906, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_11_0,
@@ -3519,7 +3564,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #endif
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_THEAD_C908, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_THEAD_C908, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
@@ -3566,12 +3611,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #endif
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_THEAD_C908V, TYPE_RISCV_CPU_THEAD_C908,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_THEAD_C908V, TYPE_RISCV_CPU_THEAD_C908,
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV,
         .vext_spec = VEXT_VERSION_1_00_0,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_TT_ASCALON, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_TT_ASCALON, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVS | RVU | RVH | RVV,
         .priv_spec = PRIV_VERSION_1_13_0,
@@ -3635,7 +3680,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.max_satp_mode = VM_1_10_SV57,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_VEYRON_V1, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_VEYRON_V1, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVS | RVU | RVH,
         .priv_spec = PRIV_VERSION_1_12_0,
@@ -3671,7 +3716,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.max_satp_mode = VM_1_10_SV48,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_XIANGSHAN_NANHU, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_XIANGSHAN_NANHU, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVB | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
@@ -3694,7 +3739,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.max_satp_mode = VM_1_10_SV39,
     ),
 
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_XIANGSHAN_KMH, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_XIANGSHAN_KMH, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVG | RVC | RVB | RVS | RVU | RVH | RVV,
         .priv_spec = PRIV_VERSION_1_13_0,
@@ -3754,7 +3799,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     ),
 
     /* https://mips.com/products/hardware/p8700/ */
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_MIPS_P8700, TYPE_RISCV_VENDOR_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_MIPS_P8700, TYPE_RISCV_VENDOR_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU,
         .priv_spec = PRIV_VERSION_1_12_0,
@@ -3777,16 +3822,16 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     ),
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_BASE128, TYPE_RISCV_DYNAMIC_CPU,
         .cfg.max_satp_mode = VM_1_10_SV57,
         .misa_mxl_max = MXL_RV128,
     ),
 #endif /* CONFIG_TCG */
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RV64I, TYPE_RISCV_BARE_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_RV64I, TYPE_RISCV_BARE_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVI
     ),
-    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_RV64E, TYPE_RISCV_BARE_CPU,
+    DEFINE_RISCV64_CPU(TYPE_RISCV_CPU_RV64E, TYPE_RISCV_BARE_CPU,
         .misa_mxl_max = MXL_RV64,
         .misa_ext = RVE
     ),
@@ -3795,7 +3840,6 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64,  TYPE_RISCV_CPU_RV64I,  RVA22S64),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA23U64,  TYPE_RISCV_CPU_RV64I,  RVA23U64),
     DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA23S64,  TYPE_RISCV_CPU_RV64I,  RVA23S64),
-#endif /* TARGET_RISCV64 */
 };
 
 DEFINE_TYPES(riscv_cpu_type_infos)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 034d7e96c49..265c6322067 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -597,6 +597,13 @@ typedef struct RISCVCPUDef {
 #endif
     /* This is just a setter for env->num_triggers.  */
     uint32_t num_triggers;
+
+    /*
+     * Optional per-CPU callback run from riscv_cpu_class_base_init
+     * after the static def is merged. Use it to adjust fields that
+     * depend on the build target (e.g. clamp misa_mxl_max for RV32).
+     */
+    void (*target_init)(struct RISCVCPUClass *mcc);
 } RISCVCPUDef;
 
 /**
-- 
2.52.0.windows.1


