Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A173C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:19:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430452.1652954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MsK-00038p-Jk; Wed, 23 Sep 2026 13:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430452.1652954; Wed, 23 Sep 2026 13:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MsK-00038i-FN; Wed, 23 Sep 2026 13:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1430452;
 Wed, 23 Sep 2026 13:19:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MsJ-000358-20
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:19:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MsI-009Ch3-FD
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:19:02 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1c3-8faa-0a2a0a5109dd-0a2a4508ada8-16
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:02 +0200
Received: from [74.125.229.140] (helo=mail-dl2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1c4-f659-0a2a45080019-4a7de58cb4c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:19:02 +0200
Received: by mail-dl2-f12.google.com with SMTP id
 a92af1059eb24-142dd046b87so729350c88.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:19:01 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:18:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169540; x=1790774340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Pnb4009fcr63720pQihUF6v8EokAjQS6rcfppqNlzc=;
        b=qwIx68aboq2H5bHUdmGRIxAsE+CUG8BNHN9/7dCEuuFlNs1ZEdfVi5WsqZTeBMM5nl
         4qYjpq4UWO9xn8M5/qiqQLRppb6Gb077DYfoZocW5jeA6Y2uVzAP3t9cfwmLLn9S485v
         SY+KAfmw/Liw1s+CCyC6l9lyiEBqm0vhTcm3olPb6nWqhoviSvbKxzjTP0qNvuCd1LNZ
         T8NgfPQTtsTrcrwAiNYoRi1pIjcl6KfnILSsFsZWNcTRsd5PVwNpSEhvsH9W0H6MIPfQ
         lJfF4u1MOhec+PX8RGiPzpdcYGekpU/l+biqcDKs5764bRM++nbpIHMiBKDHLGC83CMG
         vmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169540; x=1790774340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Pnb4009fcr63720pQihUF6v8EokAjQS6rcfppqNlzc=;
        b=vYV1DUgeoxqmagCVguSeZl1HkfFWkZb2Sh5LKQUwYo+xBgi6DPRrdcyq53quCiWWzs
         Liun6G3Hcs3QjSLvnd5h4S7Y1aTSL4heztxy7I47wnCDE5gcxKOqolaMb8+rJG8uuojH
         pxZ1VnznlNFSWsH2tjbJPcYg579xVFz2Zqj+hBt76NFYcWhLkK1M83Rls6fQJw0259fc
         VprAstmHBPkTALAzrrC/Tk/4+j70XKGLF1TB/Mtj9cyDc9A9a2d4zZsl9VYh0dLVJtbb
         dJhZTlkygKqLEQS1cwrLmTgyys2Bd+pknvHx9b9tc8b2IBDYCJR26ALIP+wvdVfF5SLx
         zdKw==
X-Forwarded-Encrypted: i=1; AKwUvBzzvd8N+jpiRQ58Jq+P2jR/CMao2UreGeh8msTqVJSCmOPpHQFR3nWVxotlICRIaUITUd1pf7441VY=@lists.xenproject.org
X-Gm-Message-State: AFuF++k/vJS6EOJuqF75JvH89RKStKrn+SGgTCuFExSc3+ROExqpM8wS
	KpTqoqbsLC952gQD2YQs2B8PGzebEX+3mJLJOdq08xsNpyVoTzi8cFpE
X-Gm-Gg: AYBFou2m8rOZJTe6nSYP6onhwjER9QlERTxHRSIbdmW4aHHxaCw31ktsaIUrigja0HH
	5UuAlpSGe0TmGW401GAZuwNpIUMKEaOqbqH8+qu/HGT9McIF9r7ELRw/kXxI4uLi9pbnHSDwHrp
	Jsqq6//tAriANFpwHV3R5AfTwtSN0o/OgF/3Zcron4fu7DygqgzIIo1LTIskp+m0BpJEQPuMMqA
	21Tj6spxNR2j86I6TV9yHE8Xh6ooKxLD//d1q0gtYCxHyqZO7/jRFeLqGILxtMdYDYBctxUWjOh
	hxu8csWGDnzMglUP7K0630r0NvF3PSd/LxfeNPnIZKBQ2wFCmSixyk1GjtiIwb5Z92ljMkSDFuw
	Em5zuPcKzZIABvwI2S5qiQlXgP359EwQ4QH6n0eNoBulOasloViV13IIwd1uB3CD22e+hEci1tT
	0MkA0Nj8JFbL8VJQJICEHV6t4xLkeETDu5rWAsBOBjKg3ZsGTgObPOWEmIGsH3+ah/vAWfNEpA2
	XvKoZS7ZDoB+K9lM3xIn5bpMmZ2z/k=
X-Received: by 2002:a05:7022:fa9:b0:143:2973:3240 with SMTP id a92af1059eb24-144f91551e9mr4241198c88.29.1790169539996;
        Wed, 23 Sep 2026 06:18:59 -0700 (PDT)
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
Subject: [PATCH v3 013/114] target-info: add target_is_* helpers for each architecture
Date: Wed, 23 Sep 2026 21:14:47 +0800
Message-ID: <20260923131635.1894-14-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790169542-CF55C87B-C0E75CE1/0/0
X-purgate-type: clean
X-purgate-size: 6657

This is added for latter use with is_available.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 91 +++++++++++++++++++++++++++++++++++++-
 target-info.c              | 83 +++++++++++++++++++++++++++++-----
 2 files changed, 161 insertions(+), 13 deletions(-)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index c48973f20be..89656da1ca4 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -53,6 +53,14 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_is_base_arm:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is ARM or Aarch64.
+ */
+bool target_is_base_arm(const TargetInfo *ti);
+
 /**
  * target_base_arm:
  *
@@ -60,6 +68,14 @@ bool target_big_endian(void);
  */
 bool target_base_arm(void);
 
+/**
+ * target_is_arm:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is ARM (32-bit, not Aarch64).
+ */
+bool target_is_arm(const TargetInfo *ti);
+
 /**
  * target_arm:
  *
@@ -67,6 +83,14 @@ bool target_base_arm(void);
  */
 bool target_arm(void);
 
+/**
+ * target_is_aarch64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is Aarch64.
+ */
+bool target_is_aarch64(const TargetInfo *ti);
+
 /**
  * target_aarch64:
  *
@@ -74,6 +98,14 @@ bool target_arm(void);
  */
 bool target_aarch64(void);
 
+/**
+ * target_is_base_ppc:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 32-bit or 64-bit.
+ */
+bool target_is_base_ppc(const TargetInfo *ti);
+
 /**
  * target_base_ppc:
  *
@@ -81,6 +113,14 @@ bool target_aarch64(void);
  */
 bool target_base_ppc(void);
 
+/**
+ * target_is_ppc:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 32-bit.
+ */
+bool target_is_ppc(const TargetInfo *ti);
+
 /**
  * target_ppc:
  *
@@ -88,6 +128,14 @@ bool target_base_ppc(void);
  */
 bool target_ppc(void);
 
+/**
+ * target_is_ppc64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is PowerPC 64-bit.
+ */
+bool target_is_ppc64(const TargetInfo *ti);
+
 /**
  * target_ppc64:
  *
@@ -95,6 +143,14 @@ bool target_ppc(void);
  */
 bool target_ppc64(void);
 
+/**
+ * target_is_s390x:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is S390x.
+ */
+bool target_is_s390x(const TargetInfo *ti);
+
 /**
  * target_s390x:
  *
@@ -102,17 +158,48 @@ bool target_ppc64(void);
  */
 bool target_s390x(void);
 
+/**
+ * target_is_base_riscv:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit or 64-bit.
+ */
+bool target_is_base_riscv(const TargetInfo *ti);
+
+/**
+ * target_base_riscv:
+ *
+ * Returns whether the target architecture is RISC-V 32-bit or 64-bit.
+ */
+bool target_base_riscv(void);
+
+/**
+ * target_is_riscv32:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit.
+ */
+bool target_is_riscv32(const TargetInfo *ti);
+
 /**
  * target_riscv32:
  *
- * Returns whether the target architecture is riscv32
+ * Returns whether the target architecture is RISC-V 32-bit.
  */
 bool target_riscv32(void);
 
+/**
+ * target_is_riscv64:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 64-bit.
+ */
+bool target_is_riscv64(const TargetInfo *ti);
+
 /**
  * target_riscv64:
  *
- * Returns whether the target architecture is riscv64
+ * Returns whether the target architecture is RISC-V 64-bit.
  */
 bool target_riscv64(void);
 
diff --git a/target-info.c b/target-info.c
index 6e66f48e1ff..6d57cad5d33 100644
--- a/target-info.c
+++ b/target-info.c
@@ -96,9 +96,9 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
-bool target_base_arm(void)
+bool target_is_base_arm(const TargetInfo *ti)
 {
-    switch (target_arch()) {
+    switch (ti->target_arch) {
     case SYS_EMU_TARGET_ARM:
     case SYS_EMU_TARGET_AARCH64:
         return true;
@@ -107,19 +107,34 @@ bool target_base_arm(void)
     }
 }
 
+bool target_base_arm(void)
+{
+    return target_is_base_arm(target_info());
+}
+
+bool target_is_arm(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_ARM;
+}
+
 bool target_arm(void)
 {
-    return target_arch() == SYS_EMU_TARGET_ARM;
+    return target_is_arm(target_info());
+}
+
+bool target_is_aarch64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_AARCH64;
 }
 
 bool target_aarch64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_AARCH64;
+    return target_is_aarch64(target_info());
 }
 
-bool target_base_ppc(void)
+bool target_is_base_ppc(const TargetInfo *ti)
 {
-    switch (target_arch()) {
+    switch (ti->target_arch) {
     case SYS_EMU_TARGET_PPC:
     case SYS_EMU_TARGET_PPC64:
         return true;
@@ -128,27 +143,73 @@ bool target_base_ppc(void)
     }
 }
 
+bool target_base_ppc(void)
+{
+    return target_is_base_ppc(target_info());
+}
+
+bool target_is_ppc(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_PPC;
+}
+
 bool target_ppc(void)
 {
-    return target_arch() == SYS_EMU_TARGET_PPC;
+    return target_is_ppc(target_info());
+}
+
+bool target_is_ppc64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_PPC64;
 }
 
 bool target_ppc64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_PPC64;
+    return target_is_ppc64(target_info());
+}
+
+bool target_is_s390x(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_S390X;
 }
 
 bool target_s390x(void)
 {
-    return target_arch() == SYS_EMU_TARGET_S390X;
+    return target_is_s390x(target_info());
+}
+
+bool target_is_base_riscv(const TargetInfo *ti)
+{
+    switch (ti->target_arch) {
+    case SYS_EMU_TARGET_RISCV32:
+    case SYS_EMU_TARGET_RISCV64:
+        return true;
+    default:
+        return false;
+    }
+}
+
+bool target_base_riscv(void)
+{
+    return target_is_base_riscv(target_info());
+}
+
+bool target_is_riscv32(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_RISCV32;
 }
 
 bool target_riscv32(void)
 {
-    return target_arch() == SYS_EMU_TARGET_RISCV32;
+    return target_is_riscv32(target_info());
+}
+
+bool target_is_riscv64(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_RISCV64;
 }
 
 bool target_riscv64(void)
 {
-    return target_arch() == SYS_EMU_TARGET_RISCV64;
+    return target_is_riscv64(target_info());
 }
-- 
2.52.0.windows.1


